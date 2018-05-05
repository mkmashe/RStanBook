library(rstan)

# データファイルを読み込む
d <- read.csv(file='./chap04/input/data-salary.txt')

# dataブロックに渡すデータを名前付きリストとして作成
data <- list(N=nrow(d), X=d$X, Y=d$Y)

# モデルファイルとデータを渡して実行する
fit <- stan(file='./chap04/model/model4-5.stan', data=data, seed=1234)
#
# stan関数はモデルファイルをコンパイルした上で、
# MCMCサンプリングを実行する
#
# fitオブジェクトはMCMCの設定や推計結果のMCMCサンプルが保存されている

# 実行結果を保存しておく
save.image(file='./chap04/output/result-model4-5.RData')
