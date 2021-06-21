package bu.mvc.respsitory;



import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import bu.mvc.domain.Member;


public interface MemberRepository extends JpaRepository<Member, Long>{
	
	/**중복체크*/
    Member findById(String id);
   
    /**
     * 아이디찾기
     * */
   @Query("select m.id from Member m where m.name = ?1 and m.dateOfBirth = ?2")
    String searchId(String name ,  LocalDate dateOfBirth);
   
   /**
    * 비밀번호찾기
    * */
   @Query("select m.password from Member m where m.id = ?1 and m.name = ?2 and m.dateOfBirth = ?3")
   String searchPass(String id, String name , LocalDate dateOfBirth);
   
   /**
    * 임시비번으로 비번수정하기 
    * */
   @Query("update Member m set m.password=?1 where m.id=?2")
   @Modifying
   void update(String password , String id);
   
   /**
    * 회원정보 수정하기 (회원)
    * */
   @Query("update Member m  set m.password=?1 ,m.alias=?2,m.email=?3  ,m.phone=?4 where m.memberCode=?5")
   @Modifying
   void updateMember(String password,String alias,String emali, String phone,Long memberCode );
   
   /**
    * 회원정보 탈퇴하기 (회원)
 * @return 
    * */
   @Query("update Member m  set m.memberState=3 where m.memberCode=?1")
   @Modifying
   void deleteMember(Long memberCode);
}

