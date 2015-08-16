# Reproducible Research: Peer Assessment 1
Emanuel Calvo  

## Loading and preprocessing the data

First, we load all the necessary libraries:




Loading the data, casts and filtering. The `act` table will contain the necessary data for the analysis.


```r
act <- read.csv("activity.csv",
                colClasses=c("numeric", "character", "numeric"))
colnames(act) <- c("steps","date","interval")
act$date <- as.Date(act$date, format = "%Y-%m-%d")
act$interval <- as.factor(act$interval)
#nona_act <- act[!is.na(act$steps),]
```


## What is mean total number of steps taken per day?

Calculating the Total steps per day:


```r
steps_by_day <- aggregate(steps ~  date , act, FUN = sum, na.rm = T)
colnames(steps_by_day) <- c("date","steps")
```

### Histogram of the total steps per day


```r
hist(steps_by_day$steps, breaks = 10, 
     main = "Histogram of the Total Steps per Day",
     xlab = "Total steps per day",
     ylab = "Number of count of steps per day")
```

![](PA1_template_files/figure-html/hist_steps-1.png) 

```r
#lengend()
```

Mean and Median:


```r
tsm1 <- mean(steps_by_day$steps)
tsm2 <- median(steps_by_day$steps)
```

The average is 1.0766189\times 10^{4} and the median is 1.0765\times 10^{4}.


## What is the average daily activity pattern?

    Time series plot of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis).



```r
steps_by_interval = aggregate(act$steps,
                              by = list(act$interval),
                              FUN = mean, na.rm = T )
colnames(steps_by_interval) <- c("interval","steps")
plot(steps_by_interval$interval, steps_by_interval$steps, type = "l",
     xlab = "5-min interval", ylab = "Average steps")
```

![](PA1_template_files/figure-html/unnamed-chunk-2-1.png) 

    Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps? The answer of this is `r `



## Imputing missing values



## Are there differences in activity patterns between weekdays and weekends?
