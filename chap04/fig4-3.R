library(ggplot2)

# 年齢と年収データを読み込む
d <- read.csv(file='./chap04/input/data-salary.txt')

# 単回帰モデルを当てはめる
res_lm <- lm(Y ~ X, data=d)

# 新しいデータを用意
X_new <- data.frame(X=23:60)

conf_95 <- predict(res_lm, X_new, interval='confidence', level=0.95)
conf_95 <- data.frame(X_new, conf_95)

conf_50 <- predict(res_lm, X_new, interval='confidence', level=0.50)
conf_50 <- data.frame(X_new, conf_50)

pred_95 <- predict(res_lm, X_new, interval='prediction', level=0.95)
pred_95 <- data.frame(X_new, pred_95)

pred_50 <- predict(res_lm, X_new, interval='prediction', level=0.50)
pred_50 <- data.frame(X_new, pred_50)

p <- ggplot()
p <- p + theme_bw(base_size=18)
p <- p + geom_ribbon(data=conf_95, aes(x=X, ymin=lwr, ymax=upr), alpha=1/6)
p <- p + geom_ribbon(data=conf_50, aes(x=X, ymin=lwr, ymax=upr), alpha=2/6)
p <- p + geom_line(data=conf_50, aes(x=X, y=fit), size=1)
p <- p + geom_point(data=d, aes(x=X, y=Y), shape=1, size=3)
p <- p + labs(x='X', y='Y') + coord_cartesian(xlim=c(22, 61), ylim=c(200, 1400))
p <- p + scale_y_continuous(breaks=seq(from=200, to=1400, by=400))
ggsave(p, file='./chap04/output/fig4-3-left.png', dpi=300, w=4, h=3)
plot(p)

p <- ggplot()
p <- p + theme_bw(base_size=18)
p <- p + geom_ribbon(data=pred_95, aes(x=X, ymin=lwr, ymax=upr), alpha=1/6)
p <- p + geom_ribbon(data=pred_50, aes(x=X, ymin=lwr, ymax=upr), alpha=2/6)
p <- p + geom_line(data=pred_50, aes(x=X, y=fit), size=1)
p <- p + geom_point(data=d, aes(x=X, y=Y), shape=1, size=3)
p <- p + labs(x='X', y='Y') + coord_cartesian(xlim=c(22, 61), ylim=c(200, 1400))
p <- p + scale_y_continuous(breaks=seq(from=200, to=1400, by=400))
ggsave(p, file='./chap04/output/fig4-3-right.png', dpi=300, w=4, h=3)
plot(p)