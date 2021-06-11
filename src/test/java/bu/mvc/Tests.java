package bu.mvc;

import java.util.Date;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import bu.mvc.domain.Contact;
import bu.mvc.domain.ContactReply;
import bu.mvc.domain.Faq;
import bu.mvc.domain.Member;
import bu.mvc.domain.Notice;
import bu.mvc.respsitory.ContactReplyRepository;
import bu.mvc.respsitory.ContactRepository;
import bu.mvc.respsitory.FaqRepository;
import bu.mvc.respsitory.NoticeRepository;

@SpringBootTest
@Transactional
@Commit
class Tests {
	
	@Autowired
	private ContactRepository rep;
	
	@Test
	void insert() {
		for(int i=0; i<=100; i++) {
			rep.save(new Contact(null, 0, "제목_"+i, "내용_"+i, 0, new Member(4L)));
		}
	}

}








