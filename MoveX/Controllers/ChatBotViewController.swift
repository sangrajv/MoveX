//
//  ChatBotViewController.swift
//  MoveX
//
//  Created by Priyanshu Kaushik on 2025-04-12.
//

import UIKit
import GoogleGenerativeAI

// Description:
// This view controller manages the chatbot interface. It integrates the Gemini API
// to allow users to interact with a friendly fitness assistant named FitBot. The bot
// provides motivational support, tips, and answers to fitness-related questions.
class ChatBotViewController: UIViewController {

    // Image view to display the chatbot logo.
    @IBOutlet var logoImageView: UIImageView!

    // Text view to show the response from the chatbot.
    @IBOutlet var responseTextView: UITextView!

    // Text field where the user inputs their questions.
    @IBOutlet var inputTextField: UITextField!

    // The GenerativeModel used to interact with the Gemini API.
    let model = GenerativeModel(name: "gemini-1.5-flash", apiKey: APIKey.default)

    // The chat session instance used to maintain context between messages.
    var chat: Chat?

    // Sets up the initial greeting and configures the chat model with a system prompt.
    // WHY: This sets the tone and behavior of the AI assistant and provides a helpful introduction to the user.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup initial greeting
        responseTextView.text = "Hi there! My name is FitBot, and I'm here to help you on your fitness journey. I'm excited to answer your questions and offer support as you work towards your goals. Whether you're looking to lose weight, build muscle, or simply improve your overall health and well-being, I'm here to guide you with helpful information and encouragement. Ask me anything!"

        // Set up chat with system prompt
        let systemPrompt = """
        You are a friendly and knowledgeable fitness assistant. Always write responses in medium-length human-readable paragraphs.
        The user is most likely going to ask about fitness tips, weight loss advice, workout plans, or dietary recommendations.
        Do not use markdown or bold text formatting (avoid using ** for bold). Keep your tone helpful, motivational, and clear.
        """
        do{
            chat = model.startChat(history: [
                try .init(role: "user", parts: [systemPrompt])
            ])
        }catch{
            responseTextView.text = "Error initializing chat: \(error)"
        }
    }
    
    // Triggered when the user taps the Send button.
    // WHY: Retrieves the user's message and begins the process of fetching an AI-generated response.
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        guard let text = inputTextField.text, !text.isEmpty else { return }
        fetchAIResponse(for: text)
        inputTextField.text = ""
    }

    // Sends the user's message to the Gemini API and displays the chatbot's response.
    // WHY: This method asynchronously communicates with the API to provide intelligent responses and updates the UI accordingly.
    func fetchAIResponse(for userInput: String) {
        responseTextView.text = ""

        Task {
            do {
                if let chat = chat {
                    let response = try await chat.sendMessage(userInput)
                    if let text = response.text {
                        responseTextView.text = text
                    } else {
                        responseTextView.text = "Sorry, I couldn't process that. Please try again."
                    }
                } else {
                    responseTextView.text = "Chat session not initialized."
                }
            } catch {
                responseTextView.text = "Something went wrong:\n\(error.localizedDescription)"
            }
        }
    }


}
