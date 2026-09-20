package com.portal.schemes.service;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SchemeScraperService {

    public List<String> scrapeSchemeTitles(String url) {
        List<String> schemeTitles = new ArrayList<>();
        try {
            Document doc = Jsoup.connect(url)
                    .userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")
                    .timeout(10000)
                    .get();

            Elements titles = doc.select(".scheme-title");
            for (Element title : titles) {
                schemeTitles.add(title.text());
            }
        } catch (Exception e) {
            System.err.println("Scraping failed for URL: " + url + " - " + e.getMessage());
        }
        return schemeTitles;
    }
}
