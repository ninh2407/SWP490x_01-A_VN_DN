package swp.controller;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;

import swp.bean.ResultLoterry;



public class Demo {
		
	public static List<ResultLoterry> insertData(String url, String id) {
		List<ResultLoterry> list = new ArrayList<>();
		try {						
		    URL feedUrl = new URL(url);
		    SyndFeedInput input = new SyndFeedInput();
		    SyndFeed feed = input.build(new XmlReader(feedUrl));
		    for (SyndEntry entry : (List<SyndEntry>) feed.getEntries()) {
		    	ResultLoterry rl = new ResultLoterry();
		    	rl.setId(id);
		    	// Lay ngay tu the link trong rss
		    	String link = entry.getLink(); 						
		    	String startDate= link.substring(link.indexOf("ngay-")+5);
		    	SimpleDateFormat sdf1 = new SimpleDateFormat("MM-dd-yyyy");		    	
		    	java.util.Date date = sdf1.parse(startDate);		    	
		    	java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 		    	
		    	rl.setPubDate(sqlStartDate);
		    	// Lay ket qua tu the description
		    	String prize = entry.getDescription().getValue().trim().replace("\n", "");
		    	rl.setPrize(prize);
		    	list.add(rl);
		    }
		} catch (Exception e) {
			// TODO: handle exception
		}
	    return list;
	}
	
	  public static void main(String[] args) throws Exception {
	    String url = "https://xskt.com.vn/rss-feed/an-giang-xsag.rss";
	    List<ResultLoterry> list = new ArrayList<>();
	    list = insertData(url, "a1");
	    for (ResultLoterry rl : list) {
			System.out.println(rl.getPubDate());
		}		  
	  }
	}