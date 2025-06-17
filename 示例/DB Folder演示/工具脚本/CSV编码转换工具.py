#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
CSV编码转换工具
用于解决DB Folder导出的CSV文件在Excel中显示乱码的问题
"""

import os
import sys
from pathlib import Path

def add_bom_to_csv(input_file, output_file=None):
    """
    为CSV文件添加BOM标记，解决Excel中文乱码问题
    
    Args:
        input_file (str): 输入CSV文件路径
        output_file (str): 输出文件路径，如果为None则覆盖原文件
    """
    try:
        # 读取原文件
        with open(input_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 如果没有指定输出文件，则覆盖原文件
        if output_file is None:
            output_file = input_file
        
        # 写入文件，添加BOM标记
        with open(output_file, 'w', encoding='utf-8-sig') as f:
            f.write(content)
        
        print(f"✅ 成功处理文件: {input_file}")
        if output_file != input_file:
            print(f"📁 输出文件: {output_file}")
        
    except Exception as e:
        print(f"❌ 处理文件失败: {e}")

def convert_to_gbk(input_file, output_file=None):
    """
    将UTF-8 CSV文件转换为GBK编码（Excel友好）
    
    Args:
        input_file (str): 输入CSV文件路径
        output_file (str): 输出文件路径
    """
    try:
        # 读取UTF-8文件
        with open(input_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 生成输出文件名
        if output_file is None:
            file_path = Path(input_file)
            output_file = file_path.parent / (file_path.stem + '_GBK.csv')
        
        # 写入GBK编码文件
        with open(output_file, 'w', encoding='gbk') as f:
            f.write(content)
        
        print(f"✅ 成功转换为GBK编码: {output_file}")
        
    except Exception as e:
        print(f"❌ 转换失败: {e}")

def main():
    """主函数"""
    print("🛠️  CSV编码转换工具")
    print("=" * 50)
    print("1. 添加BOM标记 (推荐)")
    print("2. 转换为GBK编码")
    print("3. 批量处理当前目录所有CSV文件")
    print("=" * 50)
    
    choice = input("请选择操作 (1/2/3): ").strip()
    
    if choice == "1":
        file_path = input("请输入CSV文件路径: ").strip()
        if os.path.exists(file_path):
            add_bom_to_csv(file_path)
        else:
            print("❌ 文件不存在")
    
    elif choice == "2":
        file_path = input("请输入CSV文件路径: ").strip()
        if os.path.exists(file_path):
            convert_to_gbk(file_path)
        else:
            print("❌ 文件不存在")
    
    elif choice == "3":
        current_dir = Path.cwd()
        csv_files = list(current_dir.glob("*.csv"))
        
        if not csv_files:
            print("❌ 当前目录没有找到CSV文件")
            return
        
        print(f"📁 找到 {len(csv_files)} 个CSV文件:")
        for i, file in enumerate(csv_files, 1):
            print(f"   {i}. {file.name}")
        
        method = input("\n选择处理方式 (1-BOM标记 / 2-GBK编码): ").strip()
        
        for file in csv_files:
            if method == "1":
                add_bom_to_csv(str(file))
            elif method == "2":
                convert_to_gbk(str(file))
        
        print(f"\n🎉 批量处理完成！")
    
    else:
        print("❌ 无效选择")

if __name__ == "__main__":
    main() 