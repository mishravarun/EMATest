//
//  EMATask.swift
//  TestEMA
//
//  Created by Varun Mishra on 8/22/19.
//  Copyright © 2019 Varun Mishra. All rights reserved.
//

import ResearchKit

class EMATask {
    func makeTask() -> ORKTask {
        
        let instructions = ORKInstructionStep(identifier: "EMAInstructions")
        instructions.title = "We'll ask you a few questions"
        instructions.text = "Some text by Chantal!"
        
        
        let heightQuestion = ORKQuestionStep(identifier: "heightQuestionStep",
                                             title: "Your Height",
                                             question: "How tall are  you",
                                             answer: ORKHeightAnswerFormat(measurementSystem: .metric))
        
        let stressQuestion = ORKQuestionStep(identifier: "stress",
                                            title: "Stressed?",
                                            question: "How stress do you feel right now?",
                                            answer: ORKTextChoiceAnswerFormat(style: .singleChoice,
                                                                              textChoices: [
                                                                                ORKTextChoice(text: "Not at all", value: NSNumber(integerLiteral: 0)),
                                                                                ORKTextChoice(text: "A little bit", value: NSNumber(integerLiteral: 1)),
                                                                                ORKTextChoice(text: "Moderately", value: NSNumber(integerLiteral: 2)),
                                                                                ORKTextChoice(text: "Quite a bit", value: NSNumber(integerLiteral: 3)),
                                                                                ORKTextChoice(text: "Extremely", value: NSNumber(integerLiteral: 4)),
                                                                                
                                                                                ]))
        let sleepQuestion = ORKQuestionStep(identifier: "sleep",
                                             title: "Sleep",
                                             question: "How long did you sleep last night?",
                                             answer: ORKScaleAnswerFormat(maximumValue: 12, minimumValue: 0, defaultValue: 6, step: 1))
        
        let contextQuestion = ORKQuestionStep(identifier: "context",
                                            title: "Activity?",
                                            question: "What are you doing right now?",
                                            answer: ORKTextChoiceAnswerFormat(style: .singleChoice,
                                                                              textChoices: [
                                                                                ORKTextChoice(text: "Eating", value: NSNumber(integerLiteral: 0)),
                                                                                ORKTextChoice(text: "Driving", value: NSNumber(integerLiteral: 1)),
                                                                                ORKTextChoice(text: "Working", value: NSNumber(integerLiteral: 2)),
                                                                                ORKTextChoice(text: "In a meeting", value: NSNumber(integerLiteral: 3)),
                                                                                ORKTextChoice(text: "Household Chores", value: NSNumber(integerLiteral: 4)),
                                                                                
                                                                                ]))
        
        
        let completion = ORKCompletionStep(identifier: "completionStep",
                                           title: "All Done!",
                                           text: "You have successfully completed the survey! Thanks!")
        
        return ORKOrderedTask.init(identifier: "EMAMorning",
                                   steps: [
                                    instructions,
                                    heightQuestion,
                                    stressQuestion,
                                    sleepQuestion,
                                    contextQuestion,
                                    completion])
    }
}

extension ORKTextAnswerFormat {
    public convenience init(maxLength: Int, multiLine: Bool) {
        self.init(maximumLength: maxLength)
        self.multipleLines = multiLine
    }
}

extension ORKCompletionStep {
    public convenience init(identifier: String, title: String, text: String) {
        self.init(identifier: identifier)
        self.title = title
        self.text = text
    }
}
