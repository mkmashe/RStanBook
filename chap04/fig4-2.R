library(ggplot2)

# 年齢と年収データ
d <- read.csv(file='./chap04/input/data-salary.txt')

# インプットデータを作図する
p <- ggplot(data=d, aes(x=X, y=Y))
p <- p + theme_bw(base_size=18)
p <- p + geom_point(shape=1, size=3)

plot(p)
ggsave(file='./chap04/output/fig4-2.png', plot=p, dpi=300, w=4, h=3)

