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
