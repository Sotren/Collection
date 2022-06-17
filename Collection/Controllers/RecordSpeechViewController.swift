//
//  ViewController.swift
//  Collection
//
//  Created by Станислав Москальцов  on 16.06.2022.
//

import UIKit
import Speech

class RecordSpeechViewController: UIViewController {
    
    let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "ru"))
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask: SFSpeechRecognitionTask?
    let audioEngene = AVAudioEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordButton.isEnabled = false
        speechRecognizer?.delegate = self
        authSpeech()
        
        
    }
    //MARK: - Speech recording
    func authSpeech() {
        SFSpeechRecognizer.requestAuthorization {
            status in
            var buttonState = false
            switch status {
            case .authorized:
                buttonState = true
                print("Разрешение получено")
            case .denied:
                buttonState = false
                print("Пользователь не дал разрешения на использование распознавания речи")
            case .notDetermined:
                buttonState = false
                print("Распознавание речи еще не разрешено пользователем")
            case .restricted:
                buttonState = false
                print("Распознавание речи не поддерживается на этом устройстве")
            @unknown default:
                fatalError()
            }
            DispatchQueue.main.async {
                self.recordButton.isEnabled = buttonState
            }
        }
    }
    
    override func awakeFromNib() {
        navigationItem.title = "Запесь текста"
    }
    
    @IBAction func recordButtonTapped(_ sender: UIButton) {
        if audioEngene.isRunning {
            audioEngene.stop()
            recognitionRequest?.endAudio()
            recordButton.isEnabled = false
            recordButton.setTitle("Начать запись", for: .normal)
        } else {
            startRecording()
            recordButton.setTitle("Остановить запись", for: .normal)
        }
    }
    
    func startRecording() {
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.record)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Не удалось настроить аудиосессию")
        }
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        let inputNode = audioEngene.inputNode
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Не могу создать экземпляр запроса")
        }
        recognitionRequest.shouldReportPartialResults = true
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) {
            result, error in
            var isFinal = false
            if result != nil {
                self.textView.text = result?.bestTranscription.formattedString
                isFinal = (result?.isFinal)!
            }
            if error != nil || isFinal {
                self.audioEngene.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
                self.recordButton.isEnabled = true
            }
        }
        let format = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: format) {
            buffer, _ in
            self.recognitionRequest?.append(buffer)
        }
        audioEngene.prepare()
        do {
            try audioEngene.start()
        } catch {
            print("Не удается стартонуть движок")
        }
        textView.text = "Запесь идет...."
    }
}
//MARK: - Extension SpeechRecognizer
extension RecordSpeechViewController: SFSpeechRecognizerDelegate {
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            recordButton.isEnabled = true
        } else {
            recordButton.isEnabled = false
        }
    }
}
