#1. Write a query to get the sum of impressions by day.
SELECT DATE(date) AS day, SUM(impressions) AS total_impressions
FROM marketing_performance
GROUP BY day
ORDER BY day;

#2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?
SELECT state, SUM(revenue) AS total_renvue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;
#Third highest revenue generator is CA

#3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.
SELECT c.name AS campaign_name,
  SUM(m.cost) AS total_cost,
  SUM(m.impressions) AS total_impressions,
  SUM(m.clicks) AS total_clicks,
  SUM(w.revenue) AS total_revenue
FROM campaign_info c
LEFT JOIN marketing_performance m ON c.id = m.campaign_id
LEFT JOIN website_revenue w ON c.id = w.campaign_id
GROUP BY campaign_name;

#4. Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
SELECT w.state,
  SUM(m.conversions) AS total_conversions
FROM marketing_performance m
JOIN website_revenue ON m.campaign_id = w.camppaign_id
WHERE m.campaign_id = '99058240'
GROUP BY w.state
GROUP BY total_conversions DESC
#GA had the highest number of conversions

#5. In your opinion, which campaign was the most efficient, and why?
#Campaign5 was the most efficient as the ROI is the highest
