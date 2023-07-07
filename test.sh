#!/bin/bash

check_ffmpeg() {
  if ! command -v ffmpeg &> /dev/null; then
    echo "警告: ffmpegがインストールされていません。"
    exit 1
  fi
}

convert_to_gif() {
  output="${1%.*}.gif"
  ffmpeg -i "$1" "$output"
  echo "GIFファイルが作成されました: $output"
}

convert_to_mp3() {
  output="${1%.*}.mp3"
  ffmpeg -i "$1" "$output"
  echo "MP3ファイルが作成されました: $output"
}

convert_to_images() {
  output="${1%.*}_%04d.jpg"
  ffmpeg -i "$1" "$output"
  echo "連番画像が作成されました: $output"
}

while true; do
  echo "1) mp4をgif"
  echo "2) mp4をmp3"
  echo "3) mp4を連番画像に"
  echo "4) 終了"

  read -p "処理を選択してください (1-4): " choice

  case $choice in
    1)
      read -p "ファイル名とパスを入力してください: " file
      check_ffmpeg
      convert_to_gif "$file"
      break
      ;;
    2)
      read -p "ファイル名とパスを入力してください: " file
      check_ffmpeg
      convert_to_mp3 "$file"
      break
      ;;
    3)
      read -p "ファイル名とパスを入力してください: " file
      check_ffmpeg
      convert_to_images "$file"
      break
      ;;
    4)
      echo "終了します"
      exit 0
      ;;
    *)
      echo "無効な選択です"
      ;;
  esac
done

