package bu.mvc.config;

import org.apache.commons.dbcp.BasicDataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

@Configuration
@PropertySource("/application.properties")
@EnableTransactionManagement
public class PersistenceConfig implements TransactionManagementConfigurer{	// TransactionManagementConfigurer�� <tx:annotation-driven�� ���, @EnableTransactionManagement�Բ� �ʼ�
	
	@Value("${db.driver}")
	private String driverName;
	
	@Value("${db.url}")
	private String url;
	
	@Value("${db.user}")
	private String userName;
	
	@Value("${db.pass}")
	private String password;
	
	//@Autowired
	//private BasicDataSource dataSource;
	
	//@Autowired
	//private Environment env;	// @PropertySource�� ���� ����� properties������ ��������� �ڵ� ����
	
	@Bean
	public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		PropertySourcesPlaceholderConfigurer configurer = new PropertySourcesPlaceholderConfigurer();
		//configurer.setLocation(new PathMatchingResourcePatternResolver().getResource("/WEB-INF/spring/appServlet/*.properties"));
		return configurer;
	}
	
	@Bean
	public BasicDataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		
		dataSource.setDriverClassName(driverName);
		dataSource.setUrl(url);
		dataSource.setUsername(userName);
		dataSource.setPassword(password);
		dataSource.setMaxActive(10);
		
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactoryBean getSqlSessionFactory() throws Exception{
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		
		sqlSessionFactory.setDataSource(getDataSource());
		sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:config/*Mapper.xml"));
		sqlSessionFactory.setTypeAliasesPackage("kosta.mvc.model.vo");
		sqlSessionFactory.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:config/sqlMapConfig.xml"));
		
		return sqlSessionFactory;
	}

	
	@Bean
	public SqlSessionTemplate getSqlSession() throws Exception{
		SqlSessionTemplate sqlSession = new SqlSessionTemplate(getSqlSessionFactory().getObject());
		
		return sqlSession;
	}
	
	@Bean
	public DataSourceTransactionManager getTransactionManager() {
		DataSourceTransactionManager transactionManager = new DataSourceTransactionManager();
		
		transactionManager.setDataSource(getDataSource());
		
		return transactionManager;
	}

	@Override
	public TransactionManager annotationDrivenTransactionManager() {
		
		return getTransactionManager();
	}

}






