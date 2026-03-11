# 全栈技能仓库下载脚本 (Windows)
# 基于 通用开发技能清单.md 整理
# 使用方法: .\download-skills-windows.ps1

$repos = @(
    # 需求分析
    "jwynia/agent-skills",
    "obra/superpowers",
    # 产品设计
    "jwilger/agent-skills",
    "softaworks/agent-toolkit",
    "travisjneuman/.claude",
    "aj-geddes/useful-ai-prompts",
    # UI/UX设计
    "code-yeongyu/oh-my-opencode",
    "mrgoonie/claudekit-skills",
    "nextlevelbuilder/ui-ux-pro-max-skill",
    "dirnbauer/webconsulting-skills",
    "yonatangross/orchestkit",
    "johnlindquist/claude",
    # 前端开发
    "story-has-you/skills",
    "tenequm/claude-plugins",
    "tech-leads-club/agent-skills",
    "vercel-labs/agent-skills",
    "onmax/nuxt-skills",
    "manutej/luxor-claude-marketplace",
    "rmyndharis/antigravity-skills",
    "miles990/claude-software-skills",
    "netease-youdao/lobsterai",
    "thebushidocollective/han",
    "unlayer/unlayer-skills",
    # 后端开发
    "siviter-xyz/dot-agent",
    "mindrally/skills",
    "giuseppe-trisciuoglio/developer-kit",
    "eng0ai/eng0-template-skills",
    "bobmatnyc/claude-mpm-skills",
    "sickn33/antigravity-awesome-skills",
    # 数据库设计
    "supercent-io/skills-template",
    "davila7/claude-code-templates",
    # API设计
    "asyrafhussin/agent-skills",
    "rsmdt/the-startup",
    "fulfon/lusena-dawn",
    # 测试
    "chongdashu/phaserjs-oakwoods",
    "lobbi-docs/claude",
    "terraphim/terraphim-skills",
    "andrueandersoncs/claude-skill-effect-ts",
    # DevOps
    "personamanagmentlayer/pcl",
    "bagelhole/devops-security-agent-skills",
    "ahmedasmar/devops-claude-skills",
    "cosmix/loom",
    "cap-go/capacitor-skills",
    "oimiragieo/agent-studio",
    "pluginagentmarketplace/custom-plugin-game-developer",
    "oakoss/agent-skills",
    "railwayapp/railway-skills",
    # 云平台
    "openai/skills",
    "anthropics/skills",
    # 代码质量
    "helderberto/skills",
    "metta-ai/tribal-village",
    "erichowens/some_claude_skills",
    "curiouslearner/devkit",
    "addyosmani/web-quality-skills",
    "skillcreatorai/ai-agent-skills",
    # AI/LLM
    "hoodini/ai-agents-skills",
    "llama-farm/llamafarm",
    "melodic-software/claude-code-plugins",
    "ovachiever/droid-tings",
    "vm0-ai/vm0-skills",
    "eyadsibai/ltk",
    "89jobrien/steve",
    "ruvnet/claude-flow",
    "alinaqi/claude-bootstrap",
    "phrazzld/claude-config",
    "mastepanoski/claude-skills",
    "shareai-lab/learn-claude-code",
    "404kidwiz/claude-supercode-skills"
)

$targetDir = $PSScriptRoot
if (-not $targetDir) {
    $targetDir = Get-Location
}

Set-Location $targetDir

$successCount = 0
$failCount = 0
$existCount = 0

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "全栈技能仓库下载工具 (Windows)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "目标目录: $targetDir`n" -ForegroundColor Gray

foreach ($repo in $repos) {
    $folderName = $repo -replace "/", "-"
    
    # 跳过已存在的
    if (Test-Path $folderName) {
        Write-Host "[跳过] $folderName (已存在)" -ForegroundColor Yellow
        $existCount++
        continue
    }
    
    $url = "https://github.com/$repo.git"
    Write-Host "[下载] $repo ..." -ForegroundColor Gray -NoNewline
    
    git clone --depth 1 $url $folderName 2>&1 | Out-Null
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host " 成功" -ForegroundColor Green
        $successCount++
    } else {
        Write-Host " 失败" -ForegroundColor Red
        $failCount++
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "下载完成!" -ForegroundColor Cyan
Write-Host "成功: $successCount" -ForegroundColor Green
Write-Host "失败: $failCount" -ForegroundColor Red
Write-Host "已存在: $existCount" -ForegroundColor Yellow
Write-Host "总计: $($repos.Count)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

if ($failCount -gt 0) {
    Write-Host "`n提示: 失败的仓库可能不存在或网络问题，可稍后重试" -ForegroundColor Yellow
}
