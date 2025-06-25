#!/bin/bash

# 设置目标日期和时间（格式：YYYY-MM-DD HH:MM:SS）
TARGET_DATE="2025-08-03 12:00:00"

# 将目标时间转换为时间戳
TARGET_TIMESTAMP=$(date -j -f "%Y-%m-%d %H:%M:%S" "$TARGET_DATE" +%s)

# 获取当前时间的时间戳
CURRENT_TIMESTAMP=$(date +%s)

# 计算剩余时间（秒）
REMAINING_SECONDS=$((TARGET_TIMESTAMP - CURRENT_TIMESTAMP))

# 检查是否目标时间已过
if [ $REMAINING_SECONDS -lt 0 ]; then
    echo "目标时间已过！"
    exit 1
fi

# 循环显示倒计时
while [ $REMAINING_SECONDS -gt 0 ]; do
    # 计算天、小时、分钟和秒
    DAYS=$((REMAINING_SECONDS / 86400))
    HOURS=$(((REMAINING_SECONDS % 86400) / 3600))
    MINUTES=$(((REMAINING_SECONDS % 3600) / 60))
    SECONDS=$(((REMAINING_SECONDS % 60)))

    # 显示倒计时
    echo -ne "\r倒计时：${DAYS}天 ${HOURS}小时 ${MINUTES}分钟 ${SECONDS}秒"

    # 等待1秒
    sleep 1
    #sleep 5

    # 更新剩余时间
    REMAINING_SECONDS=$((REMAINING_SECONDS - 1))
done

echo -e "\n倒计时结束！"

