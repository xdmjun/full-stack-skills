#!/bin/bash
# 全栈技能仓库下载脚本 (Linux/macOS)
# 基于 通用开发技能清单.md 整理
# 使用方法: ./download-skills.sh

# 颜色定义
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

# 技能仓库列表
repos=(
    # 需求分析
    "jwynia/agent-skills"
    "obra/superpowers"
    # 产品设计
    "jwilger/agent-skills"
    "softaworks/agent-toolkit"
    "travisjneuman/.claude"
    "aj-geddes/useful-ai-prompts"
    # UI/UX设计
    "code-yeongyu/oh-my-opencode"
    "mrgoonie/claudekit-skills"
    "nextlevelbuilder/ui-ux-pro-max-skill"
    "dirnbauer/webconsulting-skills"
    "yonatangross/orchestkit"
    "johnlindquist/claude"
    # 前端开发
    "story-has-you/skills"
    "tenequm/claude-plugins"
    "tech-leads-club/agent-skills"
    "vercel-labs/agent-skills"
    "onmax/nuxt-skills"
    "manutej/luxor-claude-marketplace"
    "rmyndharis/antigravity-skills"
    "miles990/claude-software-skills"
    "netease-youdao/lobsterai"
    "thebushidocollective/han"
    "unlayer/unlayer-skills"
    # 后端开发
    "siviter-xyz/dot-agent"
    "mindrally/skills"
    "giuseppe-trisciuoglio/developer-kit"
    "eng0ai/eng0-template-skills"
    "bobmatnyc/claude-mpm-skills"
    "sickn33/antigravity-awesome-skills"
    # 数据库设计
    "supercent-io/skills-template"
    "davila7/claude-code-templates"
    # API设计
    "asyrafhussin/agent-skills"
    "rsmdt/the-startup"
    "fulfon/lusena-dawn"
    # 测试
    "chongdashu/phaserjs-oakwoods"
    "lobbi-docs/claude"
    "terraphim/terraphim-skills"
    "andrueandersoncs/claude-skill-effect-ts"
    # DevOps
    "personamanagmentlayer/pcl"
    "bagelhole/devops-security-agent-skills"
    "ahmedasmar/devops-claude-skills"
    "cosmix/loom"
    "cap-go/capacitor-skills"
    "oimiragieo/agent-studio"
    "pluginagentmarketplace/custom-plugin-game-developer"
    "oakoss/agent-skills"
    "railwayapp/railway-skills"
    # 云平台
    "openai/skills"
    "anthropics/skills"
    # 代码质量
    "helderberto/skills"
    "metta-ai/tribal-village"
    "erichowens/some_claude_skills"
    "curiouslearner/devkit"
    "addyosmani/web-quality-skills"
    "skillcreatorai/ai-agent-skills"
    # AI/LLM
    "hoodini/ai-agents-skills"
    "llama-farm/llamafarm"
    "melodic-software/claude-code-plugins"
    "ovachiever/droid-tings"
    "vm0-ai/vm0-skills"
    "eyadsibai/ltk"
    "89jobrien/steve"
    "ruvnet/claude-flow"
    "alinaqi/claude-bootstrap"
    "phrazzld/claude-config"
    "mastepanoski/claude-skills"
    "shareai-lab/learn-claude-code"
    "404kidwiz/claude-supercode-skills"
)

# 获取脚本所在目录
target_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$target_dir" || exit 1

success_count=0
fail_count=0
exist_count=0

echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}全栈技能仓库下载工具 (Linux/macOS)${NC}"
echo -e "${CYAN}========================================${NC}"
echo -e "${GRAY}目标目录: $target_dir${NC}\n"

for repo in "${repos[@]}"; do
    # 将 / 替换为 - 作为文件夹名
    folder_name="${repo//\//-}"
    
    # 跳过已存在的
    if [ -d "$folder_name" ]; then
        echo -e "${YELLOW}[跳过]${NC} $folder_name (已存在)"
        ((exist_count++))
        continue
    fi
    
    url="https://github.com/$repo.git"
    echo -ne "${GRAY}[下载]${NC} $repo ..."
    
    if git clone --depth 1 "$url" "$folder_name" 2>/dev/null; then
        echo -e " ${GREEN}成功${NC}"
        ((success_count++))
    else
        echo -e " ${RED}失败${NC}"
        ((fail_count++))
    fi
done

echo -e "\n${CYAN}========================================${NC}"
echo -e "${CYAN}下载完成!${NC}"
echo -e "${GREEN}成功: $success_count${NC}"
echo -e "${RED}失败: $fail_count${NC}"
echo -e "${YELLOW}已存在: $exist_count${NC}"
echo -e "${CYAN}总计: ${#repos[@]}${NC}"
echo -e "${CYAN}========================================${NC}"

if [ $fail_count -gt 0 ]; then
    echo -e "\n${YELLOW}提示: 失败的仓库可能不存在或网络问题，可稍后重试${NC}"
fi
