{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf400
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 /*CodeAcademy SQL Capstone Project - Cool T Shirts - Debra Wong - 180718*/\
\
\
/*Q1*/ \
SELECT COUNT (DISTINCT utm_campaign)\
FROM page_visits;\
SELECT COUNT (DISTINCT utm_source)\
FROM page_visits;\
SELECT DISTINCT utm_campaign, utm_source\
FROM page_visits;\
\
/*Q2*/\
SELECT DISTINCT page_name\
FROM page_visits;\
\
/*Q3*/\
WITH first_touch AS (\
SELECT user_id,\
MIN(TIMESTAMP) AS first_touch_at\
FROM page_visits\
GROUP BY user_id),\
ft_attr AS (\
SELECT ft.user_id,\
ft. first_touch_at,\
pv.utm_source,\
pv.utm_campaign\
FROM first_touch AS \'91ft\'92\
JOIN page_visits AS \'91pv\'92\
ON ft.user_id = pv.user_id\
AND ft.first_touch_at = pv.timestamp)\
SELECT ft_attr.utm_source,\
ft_attr.utm_campaign, COUNT (*)\
FROM ft_attr\
GROUP BY 1,2\
ORDER BY 3 DESC;\
\
/*Q4*/\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 WITH last_touch AS (\
SELECT user_id,\
MAX(TIMESTAMP) AS last_touch_at\
FROM page_visits\
GROUP BY user_id),\
lt_attr AS (\
SELECT lt.user_id,\
lt. first_touch_at,\
pv.utm_source,\
pv.utm_campaign,\
pv.page_name\
FROM last_touch AS \'91lt\'92\
JOIN page_visits AS \'91pv\'92\
ON lt.user_id = pv.user_id\
AND lt.last_touch_at = pv.timestamp)\
SELECT lt_attr.utm_source,\
lt_attr.utm_campaign, COUNT (*)\
FROM lt_attr\
GROUP BY 1,2\
ORDER BY 3 DESC;\
\
/*Q5*/\
SELECT COUNT (DISTINCT user_id)\
FROM page_visits\
WHERE page_name = \'914 - purchase\'92;\
\
/*Q6*/\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0
\cf0 WITH last_touch AS (\
SELECT user_id,\
MAX(TIMESTAMP) AS last_touch_at\
FROM page_visits\
WHERE page_name = \'914 - purchase\'92\
GROUP BY user_id),\
lt_attr AS (\
SELECT lt.user_id,\
lt. first_touch_at,\
pv.utm_source,\
pv.utm_campaign,\
pv.page_name\
FROM last_touch AS \'91lt\'92\
JOIN page_visits AS \'91pv\'92\
ON lt.user_id = pv.user_id\
AND lt.last_touch_at = pv.timestamp)\
SELECT lt_attr.utm_source,\
lt_attr.utm_campaign, COUNT (*)\
FROM lt_attr\
GROUP BY 1,2\
ORDER BY 3 DESC;\
}