package com.bitnc4.service;

import com.bitnc4.dto.MemberDto;
import com.bitnc4.dto.QnaBoardDto;
import com.bitnc4.mapper.QnaBoardMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class QnaBoardService implements QnaBoardServiceInter {

    @Autowired
    private QnaBoardMapper qnaBoardMapper;


    @Override
    public void insertqna(QnaBoardDto dto) {
        qnaBoardMapper.insertqna(dto);
    }

    @Override
    public void selectOneBoard(int num) {

    }

    @Override
    public MemberDto searchIdOfinfo(String writer) {

        return qnaBoardMapper.searchIdOfinfo(writer);
    }

    @Override
   public List<QnaBoardDto> qnaList(int start, int perpage, String writer) {

        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("perpage", perpage);
        map.put("writer", writer);


        return qnaBoardMapper.qnaList(map);
   }

    @Override
    public QnaBoardDto getQna(int num) {
        return qnaBoardMapper.getQna(num);
    }

    @Override
    public void deleteQna(int num) {
        qnaBoardMapper.deleteQna(num);
    }

    @Override
    public int getQnaCount(String witer) {
        return qnaBoardMapper.getQnaCount(witer);
    }

    @Override
    public boolean isEqualQna(int num, String qna_pass) {
        Map<String, Object> map=new HashMap<>();
        map.put("num", num);
        map.put("qna_pass", qna_pass);
        //비번이 맞으면 1->true반환, 틀리면 0->false반환
        boolean b=qnaBoardMapper.isEqualQna(map)==0?false:true;
        return b;
    }

    @Override
    public List<QnaBoardDto> searchQna(int start, int perpage, String writer,String searchtype, String keyword) {
        Map<String, Object> map = new HashMap<>();
        map.put("start", start);
        map.put("perpage", perpage);
        map.put("searchtype",searchtype);
        map.put("writer",writer);
        map.put("keyword",keyword);
/*        log.info("{}",map.toString());*/
        return qnaBoardMapper.searchQna(map);
    }

    @Override
    public int searchQnaCount(String writer,String keyword,String searchtype) {
        Map<String, Object> map = new HashMap<>();
        map.put("writer",writer);
        map.put("keyword",keyword);
        map.put("searchtype",searchtype);

        return qnaBoardMapper.searchQnaCount(map);
    }

   /* @Override
    public void mailCode(String mail, String code) {

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom("helloa1109@naver.com");
        msg.setTo(mail);
        msg.setSubject("Dream Stay 이메일 인증번호");
        msg.setText(code);

        mailSender.send(msg);
    }
*/



}
