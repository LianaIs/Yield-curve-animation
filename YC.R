library(av)
library(gifski)
library(transformr)
library(gganimate)
library(ggplot2)

anim <- ggplot(anim1, aes(Maturity, Yield)) +
  geom_point(alpha = 0.7, show.legend = FALSE) + geom_line(aes(group=Date), linetype=1) + geom_text(label=anim1$Yield, fill = alpha(c("white"),0.5), hjust=-.25, nudge_y = 2, nudge_x = -.1) + ggtitle("Arm Coupon Bonds Yield Curve over 2020") + theme(plot.background = element_rect(fill = "#BFD5E3")) + labs(subtitle = "Arm Coupon Bonds Yield Curve over 2020",                                caption = "Source: CBA. Prepared by Liana Isayan.") + 
  # scale_size(range = c(2, 12)) +
  # Here comes the gganimate specific bits
  labs(title = 'Date: {frame_time}', x = 'Maturity', y = 'Yield') +
  transition_time(Date) +
  ease_aes('linear')

# animate(anim, renderer=gifski_renderer("test2.gif"))
animate(anim, renderer=av_renderer("test2.mp4"))
