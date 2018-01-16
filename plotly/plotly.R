
## Surface
persp(z = volcano)
plot_ly(z = volcano, type="surface")

## 3D scatter
plot_ly(mtcars, y= ~mpg, x = ~hp, z=~wt, mode = "markers", color = ~disp, text=paste("Weight:", mtcars$wt), size=~cyl, type="scatter3d")

## Line with time data
data(EuStockMarkets)
stocks <- as.data.frame(EuStockMarkets) %>% gather(index,price) %>% mutate(time = rep(time(EuStockMarkets),4))
plot_ly(stocks, x= ~time, y=~price, color=~index)

## Histogram
plot_ly(x= precip,type="histogram")

## Box
plot_ly(iris, y=~Petal.Length, color=~Species, type="box")

## Heatmap
terrain1 <- matrix(rnorm(100*100), nrow=100, ncol=100)
plot_ly(z = terrain1, type="heatmap")

## Surface
terrain2 <- matrix(sort(rnorm(100*100)), nrow=100, ncol=100)
plot_ly(z = terrain2, type="surface")

## Choropleth
state_pop <- data.frame(State = state.abb, Pop = as.vector(state.x77[,1]))
state_pop$hover <- with(state_pop, paste(State, '<br>', "Population:", Pop))

map_options <- list(scope="usa",projection=list(type='albers usa'),showlakes=TRUE,lakecolor=toRGB("white"))

plot_ly(state_pop, z=~Pop, text=~hover,locations=~State,type="choropleth", color="Blues", locationmode = 'USA-states',marker = list(line = borders)) %>% layout(title="1975 US Population", geo=map_options)

## With GGPlot
g <- ggplot(myData, aes(y = enrollment, x = class, fill = offering)) 
g <- g + geom_bar(stat = "identity")
ggplotly(g)