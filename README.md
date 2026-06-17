# 🤖 Emotion-Detecting Social Robot Using Facial and Voice Recognition with Artificial Intelligence

> **BEng Robotics and Artificial Intelligence | University of Hertfordshire**  
> **Student:** Hasinu Ravishka | **Supervisor:** Yujia Zhai | **Date:** March 2026  
> **Final Result: Distinction** 🏆

---

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Problem Statement](#problem-statement)
- [Objectives](#objectives)
- [Technologies Used](#technologies-used)
- [System Architecture](#system-architecture)
- [Key Features](#key-features)
- [Hardware Components](#hardware-components)
- [Installation Guide](#installation-guide)
- [How to Run the Project](#how-to-run-the-project)
- [Model Performance](#model-performance)
- [Future Improvements](#future-improvements)
- [Conclusion](#conclusion)
- [Repository Structure](#repository-structure)
- [Acknowledgements](#acknowledgements)

---

## 🧠 Project Overview

This project presents the design, development, and evaluation of an **intelligent social robot** capable of recognising and responding to human emotions through **multimodal perception** — combining real-time facial analysis, speech recognition, and natural language processing into a single embedded system.

The robot, named **Hasi Robot**, was built on a **Raspberry Pi 5** using affordable, off-the-shelf components. It can detect seven human emotions from facial expressions, hold natural conversations using GPT-powered AI, track a user's face using servo motors, and even detect when a person's spoken words do not match their facial expression.

The project demonstrates that **emotionally intelligent robotics** can be achieved at low cost — making it accessible for education, healthcare, and assistive technology applications.

---

## ❓ Problem Statement

Modern robots are increasingly entering domestic, healthcare, and educational environments. However, most traditional robotic systems:

- Lack the ability to understand or respond to human emotions
- Are expensive and inaccessible for small organisations
- Rely on single-channel perception (e.g. facial recognition only), which is unreliable
- Cannot detect emotional suppression or inconsistency (e.g. smiling while feeling sad)

This creates a significant gap between human expectations and robotic behaviour, limiting the social usefulness of such systems — particularly in mental health support, elderly care, and educational environments.

---

## 🎯 Objectives

| # | Objective | Status |
|---|---|---|
| 1 | Develop a real-time CNN facial emotion recognition system (≥80% accuracy) | ✅ Achieved (~85% validation accuracy) |
| 2 | Implement natural language voice interaction using speech-to-text and GPT | ✅ Achieved |
| 3 | Design a servo-controlled mechanical system for face tracking and gestures | ✅ Achieved |
| 4 | Develop an emotion-voice mismatch detection algorithm | ✅ Achieved |
| 5 | Implement persistent conversation memory across sessions | ✅ Achieved |
| 6 | Evaluate system performance in real-world conditions | ✅ Achieved (~78% real-world accuracy) |

---

## 🛠️ Technologies Used

### Programming & Frameworks
| Technology | Purpose |
|---|---|
| Python 3.9 | Core programming language |
| PyTorch | CNN model training and inference |
| OpenCV | Face detection and image processing |
| OpenAI Whisper API | Speech-to-text conversion |
| GPT-4o / GPT-3.5-turbo | Conversational AI response generation |
| pyttsx3 | Text-to-speech output |
| sounddevice | Audio recording from microphone |
| gpiozero + LGPIO | Servo motor control via GPIO |

### Dataset
| Dataset | Description |
|---|---|
| FER-2013 | 28,700 grayscale facial images across 7 emotion classes |

### Development Tools
| Tool | Purpose |
|---|---|
| Google Colab (GPU) | CNN model training |
| Tinkercad | Circuit design visualisation |
| Git / GitHub | Version control and portfolio hosting |
| JSON | Conversation memory storage |

---

## 🏗️ System Architecture

The system is built using a **modular design** consisting of five integrated components:

---

## ✨ Key Features

### 1. 🎭 Real-Time Facial Emotion Recognition
- Custom CNN trained on FER-2013 dataset
- Classifies **7 emotions**: Happy, Sad, Angry, Disgust, Fear, Surprise, Neutral
- Temporal smoothing using a 10-frame sliding window buffer
- Confidence thresholding (below 60% → classified as Neutral)
- Average inference time: **~45ms per frame** on Raspberry Pi 5

### 2. 🎤 Voice Interaction System
- Push-to-talk recording (8-second capture window)
- Silence detection to avoid empty API calls
- Filler word filtering ("hmm", "okay", "uh-huh") for cleaner dialogue
- Emotion-aware text-to-speech (speaking rate adjusts per emotion)

### 3. 🔄 Emotion-Voice Mismatch Detection
- Compares facial emotion against spoken keyword sentiment
- Identifies emotional suppression (e.g. happy face + sad words)
- Robot responds empathetically: *"You look happy, but your words sound sad"*

### 4. 🤖 Face Tracking
- Real-time servo-based horizontal face tracking
- ±45 pixel dead-zone prevents unnecessary servo jitter
- 300ms minimum delay between movements for stability

### 5. 🧠 Conversation Memory
- Stores last 20 conversation turns in a fixed-length queue
- Saves to local JSON file — persists across robot restarts
- Fully local storage: no private data sent to cloud storage

### 6. 💃 Emotion-Based Physical Gestures
- Happy → Waving gesture
- Sad → Centre position + supportive verbal response
- Surprise → Waving gesture
- 5-second cooldown prevents repetitive movements

---

## 🔧 Hardware Components

| Component | Model | Purpose |
|---|---|---|
| Main Computer | Raspberry Pi 5 (4GB RAM) | Central processing unit |
| Camera | Logitech C270 USB | 640×480 @ 30fps video capture |
| Servo Motors (×3) | MG90S Micro Servo | Face tracking + waving gesture |
| Microphone | USB Microphone | Speech recording at 16kHz |
| Speaker | 3.5mm Audio Jack Speaker | Text-to-speech output |
| Power | 5V 3A USB-C + External Power Bank | Separate power for Pi and servos |
| Connectivity | Breadboard + Jumper Wires | GPIO connections |

---

## 📦 Installation Guide

### Prerequisites
- Raspberry Pi 5 running Raspberry Pi OS
- Python 3.9 installed
- Internet connection (for OpenAI API)
- OpenAI API key

### Step 1: Clone the Repository
```bash
git clone https://github.com/YourUsername/Emotion-Detecting-Social-Robot-AI.git
cd Emotion-Detecting-Social-Robot-AI
```

### Step 2: Install Required Libraries
```bash
pip install torch torchvision --index-url https://download.pytorch.org/whl/cpu
pip install opencv-python
pip install openai
pip install pyttsx3
pip install sounddevice
pip install numpy
pip install gpiozero lgpio
```

### Step 3: Set Up Your OpenAI API Key
Open the main Python file and replace the placeholder with your API key:
```python
client = OpenAI(api_key="YOUR_API_KEY_HERE")
```

### Step 4: Download the Trained Model
Place the trained model file `model_3.pth` in the project root directory.  
*(Download link available in the Releases section of this repository)*

### Step 5: Connect Hardware
- Connect servo motors to GPIO pins **18, 19, and 15**
- Connect USB camera and USB microphone
- Connect speaker to 3.5mm audio jack
- Power servos from external power bank via breadboard

---

## ▶️ How to Run the Project

### Run the Main Robot System
```bash
python main_robot.py
```

### Keyboard Controls During Operation
| Key | Action |
|---|---|
| `V` | Activate voice conversation mode |
| `B` | Stop conversation |
| `Q` | Quit and shut down the robot |

### Train the CNN Model (Optional)
```bash
python train_emotion_model.py
```
> **Note:** Training was performed on Google Colab GPU. Running on CPU will be significantly slower.

---

## 📊 Model Performance

### Main Model Results (Full FER-2013 Dataset)

| Metric | Score |
|---|---|
| Validation Accuracy | ~85% |
| Real-World Accuracy | ~78% |
| Inference Time (Raspberry Pi 5) | ~25ms per frame |
| Face Tracking Latency | <50ms |

### Per-Class F1 Scores

| Emotion | F1 Score |
|---|---|
| Happy (Class 3) | 0.83 ⭐ Best |
| Surprise (Class 6) | 0.80 |
| Neutral (Class 0) | 0.79 |
| Angry (Class 1) | 0.82 |
| Fear (Class 4) | 0.81 |
| Sad (Class 5) | 0.81 |
| Disgust (Class 2) | 0.80 |

---

## 🚀 Future Improvements

1. **On-Device AI** — Replace cloud APIs with local models (Whisper.cpp, LLaMA) for offline operation and improved privacy
2. **Multi-Person Tracking** — Extend face tracking to handle multiple users simultaneously
3. **Temporal Emotion Modelling** — Track emotional changes over time rather than single-frame predictions
4. **3-DOF Neck Mechanism** — Add pan, tilt, and roll for more natural head movement
5. **Animated Face Display** — Add a small screen showing animated eye and mouth expressions
6. **Voice Activity Detection** — Replace fixed 8-second recording with smart silence detection (reduces latency by 2–3 seconds)
7. **User Profiles** — Store individual user preferences and emotional history for personalised responses
8. **Clinical Validation** — Test in real healthcare environments (elderly care, mental health support)
9. **Expanded Emotion Categories** — Move beyond FER-2013 to include compound emotions and cultural variations
10. **University Kiosk Application** — Deploy as an AI student support assistant (Ask Herts use case)

---

## 🏁 Conclusion

This project successfully demonstrates that an **emotionally intelligent social robot** can be built using affordable hardware and open-source tools. The Hasi Robot integrates computer vision, deep learning, speech processing, and physical actuation into a single coherent system that can perceive, interpret, and respond to human emotions in real time.

Key achievements include:
- A custom CNN achieving **~85% validation accuracy** on seven emotion classes
- A novel **emotion-voice mismatch detection** mechanism
- A **hybrid edge-cloud architecture** balancing performance and cost
- A fully functional, real-time embedded system running on Raspberry Pi 5
- A **local conversation memory system** with privacy-preserving JSON storage

The results confirm that multimodal emotion recognition significantly improves the quality and authenticity of human-robot interaction — and that such systems have strong commercial potential in elderly care, autism support, mental health, and conversational AI markets.

---

## 📁 Repository Structure

```
Emotion-Detecting-Social-Robot-AI/
│
├── main_robot.py                  # Main robot control loop
├── train_emotion_model.py         # CNN training script
├── emotion_detector.py            # CNN model architecture
├── voice_interaction.py           # Whisper + GPT voice module
├── servo_control.py               # Servo motor control functions
├── mismatch_detection.py          # Emotion-voice mismatch logic
├── conversation_memory.json       # Saved conversation history
├── model_3.pth                    # Trained CNN model weights
├── requirements.txt               # Python dependencies
├── README.md                      # This file
│
├── training/
│   ├── dataset_preparation.py
│   ├── model_evaluation.py
│   └── plots/                     # Training graphs and confusion matrices
│
└── docs/
    ├── FYP_Report.pdf             # Full project report
    └── circuit_diagram.png        # Hardware wiring diagram
```

## 🙏 Acknowledgements

- **Supervisor:** Yujia Zhai — University of Hertfordshire
- **Dataset:** FER-2013 — Kaggle
- **Open-Source Libraries:** PyTorch, OpenCV, OpenAI, pyttsx3
- **University of Hertfordshire** — Department of Engineering, School of Physics, Engineering and Computer Science

---

## 📬 Contact

**Hasinu Ravishka**  
BEng Robotics and Artificial Intelligence — University of Hertfordshire  
 
🔗 [https://www.linkedin.com/in/hasinu-ravishka/]  


---

*⭐ If you found this project useful or interesting, please consider giving it a star on GitHub!*
