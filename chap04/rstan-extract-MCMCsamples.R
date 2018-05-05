load('./chap04/output/result-model4-5.RData')

# stan実行結果データから
# 基本年収のベイズ信頼区間とベイズ予測区間を計算する

# fitオブジェクトに格納されているMCMCサンプルを取り出す
ms <- rstan::extract(fit)

# パラメータa(切片)のMCMCサンプルは
ms$a
# パラメータb(傾き)のMCMCサンプルは
ms$b

# パラメータbの95%信頼区間を求める
quantile(ms$b, probs = c(0.025, 0.975))

N_mcmc <- length(ms$lp__)
y50_base <- ms$a + ms$b * 50
y50 <- rnorm(n=N_mcmc, mean=y50_base, sd=ms$sigma)
d_mcmc <- data.frame(a=ms$a, b=ms$b, sigma=ms$sigma, y50_base, y50)
