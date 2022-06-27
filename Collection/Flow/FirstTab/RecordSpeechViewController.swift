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
    @IBOutlet weak var imageForPicker: UIImageView!
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    var recognitionTask: SFSpeechRecognitionTask?
    let audioEngine = AVAudioEngine()
    var imagePicker: ImagePicker!
    // MARK: - ViewController lifecycle
    override func awakeFromNib() {
        navigationItem.title = "Запись текста"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recordButton.isEnabled = false
        speechRecognizer?.delegate = self
        authSpeech()
        imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    //MARK: - ImagePicker
    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }
    //MARK: - Speech recording
    private func authSpeech() {
        SFSpeechRecognizer.requestAuthorization {
            status in
            var enableButton = false
            switch status {
            case .authorized:
                enableButton = true
                print("Разрешение получено")
            case .denied:
                enableButton = false
                print("Пользователь не дал разрешения на использование распознавания речи")
            case .notDetermined:
                enableButton = false
                print("Распознавание речи еще не разрешено пользователем")
            case .restricted:
                enableButton = false
                print("Распознавание речи не поддерживается на этом устройстве")
            @unknown default:
                fatalError()
            }
            DispatchQueue.main.async {
                self.recordButton.isEnabled = enableButton
            }
        }
    }
    
    @IBAction func recordButtonTapped(_ sender: UIButton) {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            recordButton.isEnabled = false
            recordButton.setTitle("Начать запись", for: .normal)
        } else {
            startRecording()
            recordButton.setTitle("Остановить запись", for: .normal)
        }
        textView.text = "Запесь идет...."
    }
    
    private func startRecording() {
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
        let inputNode = audioEngine.inputNode
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
                self.audioEngine.stop()
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
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("Не удается стартонуть движок")
        }
    }
}
//MARK: - Extension SpeechRecognizer
extension RecordSpeechViewController: SFSpeechRecognizerDelegate {
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        recordButton.isEnabled = available
    }
}
//MARK: - ImagePikerDelegate
extension RecordSpeechViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        self.imageForPicker.image = image
    }
}
