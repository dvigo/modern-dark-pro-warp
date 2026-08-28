#!/usr/bin/env python3
"""
Generate SVG preview cards for Modern Dark Pro Warp themes.
Reads YAML theme files and outputs SVG palette cards.
"""

import os
import re
import sys
from pathlib import Path

def parse_simple_yaml(filepath):
    """Simple parser for Warp theme YAML files to avoid external dependencies."""
    data = {"terminal_colors": {"normal": {}, "bright": {}}}
    current_section = None
    
    with open(filepath, "r", encoding="utf-8") as f:
        for line in f:
            raw_line = line
            line_str = line.strip()
            if not line_str or line_str.startswith("#"):
                continue
            
            # Root level properties (e.g. name: Modern Dark Pro - Night, accent: '#64b5f6')
            m_root = re.match(r"^([a-zA-Z_]+):\s*['\"]?([^\'\"]+)['\"]?$", line_str)
            if m_root and not raw_line.startswith(" "):
                data[m_root.group(1)] = m_root.group(2).strip()
                continue
                
            if "normal:" in line_str:
                current_section = "normal"
                continue
            elif "bright:" in line_str:
                current_section = "bright"
                continue
                
            # Color properties inside normal / bright sections
            m_color = re.match(r"^([a-zA-Z]+):\s*['\"]?([^\'\"]+)['\"]?$", line_str)
            if m_color and current_section:
                data["terminal_colors"][current_section][m_color.group(1)] = m_color.group(2).strip()
                
    return data

def generate_svg(theme_data, output_path):
    name = theme_data.get("name", "Warp Theme")
    bg = theme_data.get("background", "#0f0f0f")
    fg = theme_data.get("foreground", "#e0e0e0")
    accent = theme_data.get("accent", "#64b5f6")
    
    normal_colors = theme_data.get("terminal_colors", {}).get("normal", {})
    bright_colors = theme_data.get("terminal_colors", {}).get("bright", {})
    
    color_order = ["black", "red", "green", "yellow", "blue", "magenta", "cyan", "white"]
    
    width = 800
    height = 240
    
    svg = [
        f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {width} {height}" width="{width}" height="{height}">',
        f'  <rect width="{width}" height="{height}" rx="12" fill="{bg}" stroke="#333333" stroke-width="2"/>',
        f'  <text x="24" y="38" font-family="system-ui, -apple-system, sans-serif" font-size="20" font-weight="bold" fill="{fg}">{name}</text>',
        f'  <circle cx="{width - 40}" cy="32" r="8" fill="{accent}"/>',
        f'  <text x="{width - 56}" y="37" font-family="system-ui, -apple-system, sans-serif" font-size="12" fill="{accent}" text-anchor="end">ACCENT</text>',
        '  <g transform="translate(24, 60)">',
        f'    <text x="0" y="16" font-family="monospace" font-size="12" fill="{fg}">Normal:</text>'
    ]
    
    x_offset = 70
    for color_name in color_order:
        hex_val = normal_colors.get(color_name, "#888888")
        svg.append(f'    <rect x="{x_offset}" y="2" width="70" height="24" rx="4" fill="{hex_val}"/>')
        svg.append(f'    <text x="{x_offset + 35}" y="42" font-family="monospace" font-size="10" fill="{fg}" text-anchor="middle">{color_name}</text>')
        x_offset += 85
        
    svg.append('  </g>')
    svg.append('  <g transform="translate(24, 130)">')
    svg.append(f'    <text x="0" y="16" font-family="monospace" font-size="12" fill="{fg}">Bright:</text>')
    
    x_offset = 70
    for color_name in color_order:
        hex_val = bright_colors.get(color_name, "#ffffff")
        svg.append(f'    <rect x="{x_offset}" y="2" width="70" height="24" rx="4" fill="{hex_val}"/>')
        svg.append(f'    <text x="{x_offset + 35}" y="42" font-family="monospace" font-size="10" fill="{fg}" text-anchor="middle">{hex_val}</text>')
        x_offset += 85
        
    svg.append('  </g>')
    svg.append('</svg>')
    
    with open(output_path, "w", encoding="utf-8") as f:
        f.write("\n".join(svg))
    print(f"✓ Generated SVG preview: {output_path}")

def main():
    repo_root = Path(__file__).resolve().parent.parent
    themes_dir = repo_root / "themes"
    output_dir = repo_root / "screenshots"
    output_dir.mkdir(exist_ok=True)
    
    for yaml_file in themes_dir.glob("*.yaml"):
        theme_data = parse_simple_yaml(yaml_file)
        svg_filename = f"preview-{yaml_file.stem}.svg"
        output_path = output_dir / svg_filename
        generate_svg(theme_data, output_path)

if __name__ == "__main__":
    main()
