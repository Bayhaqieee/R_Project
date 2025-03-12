tournament <- function(input) {
  
  # convert input to dataframe
  input <- strsplit(input, ";")
  input <- input[sapply(input,length) == 3] # handles too many separators test case
  input <- data.frame(
    Team1 = sapply(input, function(x) x[1]),
    Team2 = sapply(input, function(x) x[2]),
    Results_Team1 = sapply(input, function(x) x[3])
  )
  
  # stack the columns
  df <- cbind(stack(input[1:2]), input[3])
  
  # Create the final results column
  df$Tally[ df$Results_Team1 == "draw"] = "D"
  df$Tally[ df$Results_Team1 == "win" & df$ind == "Team1" ] = "W"
  df$Tally[ df$Results_Team1 == "win" & df$ind == "Team2" ] = "L"
  df$Tally[ df$Results_Team1 == "loss" & df$ind == "Team1" ] = "L"
  df$Tally[ df$Results_Team1 == "loss" & df$ind == "Team2" ] = "W"
  
  # Remove the ind and Results_Team1 column
  df <- df[ c("values","Tally") ]
  
  # pivot the table
  df <- xtabs(~ values + Tally, data = df)
  df <- as.data.frame.array(df)
  
  # Create the MP, and P columns
  df$MP <- with(df, D+L+W)
  df$P <- with(df, D+3*W)
  
  # Order by Points
  df <- df[order(df$P, decreasing = TRUE),]
  
  # Arrange column names
  df$Team <- rownames(df)
  rownames(df) <- NULL
  col_order <- c("Team", "MP", "W", "D", "L", "P")
  df <- df[, col_order]
  
  return(df)
 }