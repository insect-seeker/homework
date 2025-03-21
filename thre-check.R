# 自定义函数
check_above_threshold <- function() {
  # 生成随机向量
  random_vector <- rnorm(n = 10, mean = 35, sd = 10)
  
  # 初始化一个逻辑向量，用于存储每个值是否高于阈值
  above_threshold <- logical(length = 10)
  
  # 遍历随机向量的每个元素
  for (i in 1:length(random_vector)) {
    # 检查当前值是否高于阈值35
    if (random_vector[i] > 35) {
      above_threshold[i] <- TRUE
    } else {
      above_threshold[i] <- FALSE
    }
  }
  
  # 返回结果
  list(random_vector = random_vector, above_threshold = above_threshold)
}

# 调用函数并打印结果
result <- check_above_threshold()
print(result)
