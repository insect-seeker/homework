# 加载所需的包
library("dplyr")
library("ade4")

# 使用管道操作符处理doubs数据集中的env数据
result <- doubs$env |>
  # 选取 dfs, alt, oxy 列
  select(dfs, alt, oxy) |>
  # 重命名 dfs 为 distance，oxy 为 oxygen
  rename(distance = dfs, oxygen = oxy) |>
  # 保留 alt 大于 200 米行
  filter(alt > 200) |>
  # 按 alt 降序排列
  arrange(desc(alt)) |>
  # 新增一列 oxygen_category，根据 oxygen 是否大于 90，分为 high 和 low 类别
  mutate(oxygen_category = ifelse(oxygen > 90, "High", "Low")) |>
  # 计算每个类别的平均 alt 和平均 PH
  group_by(oxygen_category) |>
  summarise(mean_alt = mean(alt), mean_ph = mean(oxygen))

# 输出结果
print(result)

# 加载所需的包
library("ggplot2")
library("ade4")

# 绘制x=alt与y=oxy之间的散点图
ggplot(data = doubs$env) +
  geom_point(mapping = aes(x = alt, y = oxy))

# 在上述散点图中，将数据dfs距离调整颜色
ggplot(data = doubs$env) +
  geom_point(mapping = aes(x = alt, y = oxy, color = dfs))

