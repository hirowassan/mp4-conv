#!/bin/bash
clear
if command -v ffmpeg &>/dev/null; then
  echo "ffmpegがインストールされています!"
    if [ ! -d "output" ]; then
        mkdir output
    fi
	echo ' _   _ _'
	echo '| | | (_)_ __ _____      ____ _ ___ ___  __ _ _ __'
	echo '| |_| | | '\''_// _ \ \ /\ / / _` / __/ __|/ _` | '\''_ \'
	echo '|  _  | | | | (_) \ V  V / (_| \__ \__ \ (_| | | | |'
	echo '|_| |_|_|_|  \___/ \_/\_/ \__,_|___/___/\__,_|_| |_|'
	echo "下記のファイルが指定できるファイル名です"
	ls *.mp4
	while true
	do
    	read -p "ファイル名を入力してください: " FILE

    	if [[ "$FILE" != *.mp4 ]]; then
    	    FILE="${FILE}.mp4"
    	fi

    	if [ -z "$FILE" ]; then
        	echo "ちゃんとファイル名を入力してください!"
        	continue
    	fi

    	read -p "出力するファイルの名前を入力してください: " OUTPUT

    	if [ -z "$OUTPUT" ]; then
        	echo "ちゃんと名前を入力してください!"
        	continue
    	fi


    	echo "変換したい形式を選択してください："
    	echo "1. mp4→gif"
    	echo "2. mp4→mp3"
    	echo "3. mp4を無音化"
    	echo "4. 終了"

    	read -p "選択: " OPTION

    	if [ "$OPTION" = "1" ]; then
        	ffmpeg -i "$FILE" ./output/$OUTPUT.gif
		clear
		echo "outputに$OUTPUT.gifが出力されました!"
		break
    	elif [ "$OPTION" = "2" ]; then
        	ffmpeg -i "$FILE" ./output/$OUTPUT.mp3
		clear
		echo "outputに$OUTPUT.mp3が出力されました!"
		break
    	elif [ "$OPTION" = "3" ]; then
        	ffmpeg -i "$FILE" -an ./output/$OUTPUT.mp4
		clear
		echo "outputに$OUTPUT.mp4が出力されました!"
		break
    	elif [ "$OPTION" = "4" ]; then
		clear
        	break
    	else
        	echo "無効な選択肢です。"
	    fi
	done

else
  
  clear
  echo "ffmpegがインストールされていません。"
  echo "ffmpeg-install.shを実行してください。"
fi
