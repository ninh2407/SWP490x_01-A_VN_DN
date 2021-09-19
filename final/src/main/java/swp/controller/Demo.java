package swp.controller;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;

import swp.model.LotteryResult;


public class Demo {
		
	public static List<LotteryResult> insertData(String url, String id) {
		List<LotteryResult> list = new ArrayList<>();
		try {						
		    URL feedUrl = new URL(url);
		    SyndFeedInput input = new SyndFeedInput();
		    SyndFeed feed = input.build(new XmlReader(feedUrl));
		    for (SyndEntry entry : (List<SyndEntry>) feed.getEntries()) {
		    	LotteryResult rl = new LotteryResult();
		    	rl.setCompanyId(id);
		    	// Lay ngay tu the link trong rss
		    	String link = entry.getLink(); 						
		    	String startDate = link.substring(link.indexOf("ngay-")+5);
		    	SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");		    	
		    	java.util.Date date = sdf1.parse(startDate);		    	
		    	java.sql.Date sqlStartDate = new java.sql.Date(date.getTime()); 		    	
		    	rl.setOpenDate(sqlStartDate);
		    	// Lay ket qua tu the description
		    	String prize = entry.getDescription().getValue().replace("\n", "").replace("\s", "");
		    	System.out.println(prize);
		    	rl.setPrize(prize);
		    	list.add(rl);
		    }
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("not oke");
	    return list;
	}
	
	  public static void main(String[] args) throws Exception {
	    String url = "https://xskt.com.vn/rss-feed/mien-bac-xsmb.rss";
	    List<LotteryResult> list = new ArrayList<>();
	    list = insertData(url, "a1");
	    for (LotteryResult rl : list) {
			System.out.println(rl.getFifthPrize());
		}
	    System.out.println("oke");
	  }
	}