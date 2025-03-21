# 查找包
# 获取CRAN上所有可用的包
all_packages <- available.packages(repos = "https://cran.r-project.org")
# 检查 tidyverse 包是否存在
if ("tidyverse" %in% rownames(all_packages)) {
  cat("tidyverse 包已找到，可以安装。\n")
} else {
  cat("tidyverse 包未找到，请检查网络或CRAN源。\n")
}

# 安装包
# 检查 tidyverse 是否已经安装
if (!requireNamespace("tidyverse", quietly = TRUE)) {
  cat("正在安装 tidyverse 包...\n")
  install.packages("tidyverse", repos = "https://cran.r-project.org")
  cat("tidyverse 包安装完成。\n")
} else {
  cat("tidyverse 包已安装。\n")
}

# 加载包并查看版本信息
cat("加载 tidyverse 包并查看版本信息...\n")
library(tidyverse)
sessionInfo()



