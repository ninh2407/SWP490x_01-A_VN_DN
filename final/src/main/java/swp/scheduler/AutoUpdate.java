package swp.scheduler;

import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;

import swp.DAO.impl.CompanyDAOImpl;
import swp.DAO.impl.LotteryResultDAOImpl;
import swp.model.Company;
import swp.model.LotteryResult;

@Component("updater")
public class AutoUpdate {
	@Autowired
	private CompanyDAOImpl companyDAOImpl;

	@Autowired
	private LotteryResultDAOImpl lotteryResultDAOImpl;
	
	//Cap nhat ket qua xo so vao database theo rss cua tung cong ty
	public void insertDataResult(String url, String id) {
		List<LotteryResult> list = new ArrayList<>();
		try {
			URL feedUrl = new URL(url);
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));

			// Duyet qua tung ket qua trong link rss
			for (SyndEntry entry : (List<SyndEntry>) feed.getEntries()) {
				LotteryResult rl = new LotteryResult();
				rl.setCompanyId(id);

				// Lay ngay tu the link trong rss
				String link = entry.getLink();
				String openDate = link.substring(link.indexOf("ngay-") + 5);
				SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
				java.util.Date date = sdf1.parse(openDate);
				java.sql.Date sqlOpenDate = new java.sql.Date(date.getTime());
				rl.setOpenDate(sqlOpenDate);

				// Lay ket qua tu the description
				String prize = entry.getDescription().getValue().trim().replace("\n", "");
				rl.setPrize(prize);
				
				// Chen ket qua cu vao truoc
				list.add(0, rl);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		for (LotteryResult rl : list) {
			// Kiem tra neu ngay mo thuong cua ket qua phai > ngay mo thuong moi nhat
			// trong database
			Date latestDate = lotteryResultDAOImpl.getLatestOpenDate(id);
			if (latestDate == null || latestDate.compareTo(rl.getOpenDate()) < 0) {
				lotteryResultDAOImpl.addResult(rl);
			}
		}
	}

	// Cap nhat ket qua cua tat ca cong ty
	public void autoUpdateResult() {
		List<Company> list = companyDAOImpl.getAll();
		for (Company company : list) {
			insertDataResult(company.getLinkRss(), company.getId());
		}
		System.out.println("Auto updated");
	}
}
