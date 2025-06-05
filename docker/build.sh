#!/bin/bash
set -e

REPO="heiher/natmap"
ARCHS=(
  arm32 arm32hf arm32v7 arm32v7hf arm64
  i586 i686 loong64 m68k microblaze microblazeel
  mips32 mips32el mips32elsf mips32sf
  mips64 mips64el powerpc powerpc64
  riscv32 riscv64 s390x sh sheb x86_64
)

# 获取最新 tag
LATEST_TAG=$(curl -s https://api.github.com/repos/$REPO/releases/latest | jq -r .tag_name)
echo "Latest version: $LATEST_TAG"

# 构建所有架构版本的镜像
for ARCH in "${ARCHS[@]}"; do
  IMAGE_TAG="natmap:${ARCH}"

  echo "➡ Building $IMAGE_TAG ..."
  docker build \
    --build-arg ARCH="$ARCH" \
    --build-arg VERSION="$LATEST_TAG" \
    -t "$IMAGE_TAG" \
    .

done

echo "✅ All builds complete."
