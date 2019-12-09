

# Read the HTML file
abh <- read_html('abhijit_banerjee.html')
est <- read_html('Esther_Duflo.html')


#create the citation table for Abhijit
paperName_abh <- abh %>% html_nodes(xpath = '//*[@class="gsc_a_at"]') %>% html_text()
mix_abh <- abh %>% html_nodes(xpath = '//*[@class="gs_gray"]') %>% html_text()
researcher_abh <- rep("",495)
journal_abh <- rep("",495)
for(i in 1:990){
  if(i %% 2 ==0){
    journal_abh[i/2] <- mix_abh[i]
  }else{
    researcher_abh[(1+i)/2] <- mix_abh[i]
  }
}
cite_abh <- abh %>% html_nodes(xpath = '//*[@class="gsc_a_ac gs_ibl"]') %>% html_text() %>% as.numeric()
year_abh <- abh %>% html_nodes(xpath = '//*[@class="gsc_a_h gsc_a_hc gs_ibl"]') %>% html_text() %>% as.numeric()
citation_abh <- data.frame(paperName_abh,researcher_abh,journal_abh,cite_abh,year_abh)
head(citation_abh)
write.csv(citation_abh,"citation_abh.csv")


#create the citation table for Esther
paperName_est <- est %>% html_nodes(xpath = '//*[@class="gsc_a_at"]') %>% html_text()
mix_est <- est %>% html_nodes(xpath = '//*[@class="gs_gray"]') %>% html_text()
researcher_est <- rep("",491)
journal_est <- rep("",491)
for(i in 1:982){
  if(i %% 2 ==0){
    journal_est[i/2] <- mix_est[i+3]
  }else{
    researcher_est[(1+i)/2] <- mix_est[i+3]
  }
}
cite_est <- est %>% html_nodes(xpath = '//*[@class="gsc_a_ac gs_ibl"]') %>% html_text() %>% as.numeric()
year_est <- est %>% html_nodes(xpath = '//*[@class="gsc_a_h gsc_a_hc gs_ibl"]') %>% html_text() %>% as.numeric()
citation_est <- data.frame(paperName_est,researcher_est,journal_est,cite_est,year_est)
head(citation_est)
write.csv(citation_est,"citation_est.csv")