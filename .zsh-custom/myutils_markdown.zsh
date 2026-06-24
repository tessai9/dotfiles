### --- Pre-Required ---
### tesao/myutils-markdown container image

image_name=tesao/myutils-markdown
image_tag=0.4

# Markdown Export
# 使用例: md-export notes.md output.pdf (カレントに出力)
# 使用例: md-export notes.md ../exports/result.pdf (上位ディレクトリに出力)
md-export() {
    if [[ -z "$1" || -z "$2" ]]; then
        echo "Usage: md-export <input.md> <output_path>"
        return 1
    fi

    local input_path=$(realpath "$1")
    local output_path="$2"
    local work_dir=$(pwd)

    # 出力先パスがカレントより上にある場合、マウントポイントを調整する
    # シンプルにするため、常にカレントディレクトリを /app にマウントする
    docker run --rm -v "$work_dir:/app" "$image_name:$image_tag" \
        pandoc "/app/${1#./}" -o "/app/${output_path#./}"
    
    echo "Exported to: $output_path"
}

# Markdown Preview
# 使用例: md-preview (カレントディレクトリをプレビュー)
# 使用例: md-preview /path/to/project (指定ディレクトリをプレビュー)
md-preview() {
    local target_dir=${1:-$(pwd)}
    local port=8080

    if [ "$(docker ps -q -f name=md-preview)" ]; then
        docker stop md-preview > /dev/null
    fi

    echo "Serving $target_dir at http://localhost:$port"
    docker run -d --rm \
        --name md-preview \
        -p $port:$port \
        -v "$target_dir:/app" \
        "$image_name:$image_tag"
}

# Preview 停止用
function md-preview-stop() {
    docker stop md-preview
}
