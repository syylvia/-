package DB;
import java.io.FileInputStream;
import java.util.Properties;

//配置类
public class Config {
	private static Properties p = null;
	static {
		try {
			p = new Properties();
			// 加载配置文件
			p.load(new FileInputStream("/Users/yeyuxin/Desktop/Graduation-project/src/DB/mysql.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 获取键对应的值
	public static String getValue(String key) {
		return p.get(key).toString();
	}
}
