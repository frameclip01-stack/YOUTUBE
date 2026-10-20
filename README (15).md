# 🎬 AutoVidNarrator

**Automated Video Narration Pipeline** - Transform your videos with AI-generated voiceovers, smart subtitles, and professional styling.

## ✨ Features

- 🎤 **Text-to-Speech Generation** - Convert scripts to natural voiceover using Google TTS
- ⚡ **Speed Control** - Automatically speed up voiceover (configurable, default 1.35x)
- ✂️ **Smart Video Trimming** - Auto-trim videos to match voiceover duration
- 📝 **AI Subtitle Generation** - Uses OpenAI Whisper for accurate transcription
- 🎨 **Professional Subtitle Styling** - Chunked, styled subtitles with custom fonts
- 🔥 **Hardcoded Subtitle Burning** - Final videos with embedded subtitles
- 🏗️ **Modular Architecture** - Clean, maintainable code structure

## 🚀 Quick Start

### Prerequisites

- Python 3.8+
- FFmpeg installed and in PATH
- OpenAI Whisper

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/AutoVidNarrator.git
   cd AutoVidNarrator
   ```

2. **Create virtual environment**
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Install FFmpeg**
   - Download from [FFmpeg official site](https://ffmpeg.org/download.html)
   - Add to system PATH

### Usage

1. **Prepare your files**
   - Place your video file as `input.mp4`
   - Create your script in `script.txt`

2. **Run the pipeline**
   ```bash
   python main.py
   ```

3. **Get your results**
   - `final_with_subs.mp4` - Your finished video with voiceover and subtitles

## ⚙️ Configuration

Edit `config.py` to customize:

```python
# File paths
VIDEO_PATH = Path("input.mp4")
SCRIPT_PATH = Path("script.txt")

# Audio processing
VOICEOVER_SPEED = 1.35      # Speed multiplier (1.0 = normal)
AUTO_TRIM_VIDEO = True      # Auto-trim video to match audio

# Subtitle settings
MAX_WORDS_PER_CHUNK = 5     # Words per subtitle chunk
MIN_CHUNK_MS = 450          # Minimum subtitle duration
WHISPER_MODEL = "small"     # Whisper model size
```

## 📁 Project Structure

```
AutoVidNarrator/
├── main.py                 # Main execution script
├── config.py              # Configuration settings
├── utils.py               # Utility functions
├── tts.py                 # Text-to-speech module
├── transcription.py       # Whisper transcription
├── subtitle_processor.py  # Subtitle processing
├── video_processor.py     # Video merging & burning
├── requirements.txt       # Python dependencies
└── README.md              # This file
```

## 🎯 Workflow

1. **Text-to-Speech**: Converts your script to MP3 voiceover
2. **Speed Adjustment**: Speeds up audio for better pacing
3. **Transcription**: Uses Whisper to generate accurate subtitles
4. **Subtitle Chunking**: Breaks subtitles into readable chunks
5. **Video Processing**: Merges video with audio and trims to fit
6. **Subtitle Styling**: Creates professional ASS-styled subtitles
7. **Final Rendering**: Burns subtitles into video for distribution

## 🛠️ Advanced Features

### Custom Fonts
Place OpenSans font files in your project directory or install system-wide for best results.

### Subtitle Styling
Modify `build_ass_from_srt()` in `subtitle_processor.py` to customize:
- Font size and family
- Colors and outlines
- Position and alignment
- Animation effects

### Multiple Languages
Change `LANGUAGE` in `config.py` and update TTS language in `tts.py`.

## 📋 Requirements

- `gtts` - Google Text-to-Speech
- `moviepy` - Video processing
- `pysrt` - Subtitle file handling
- `openai-whisper` - AI transcription

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [OpenAI Whisper](https://github.com/openai/whisper) for transcription
- [MoviePy](https://zulko.github.io/moviepy/) for video processing
- [FFmpeg](https://ffmpeg.org/) for media processing
- [Google Text-to-Speech](https://cloud.google.com/text-to-speech) for voice generation


---

**Made with ❤️ for content creators who want to automate their video production workflow**