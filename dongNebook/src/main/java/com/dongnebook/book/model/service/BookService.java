package com.dongnebook.book.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.book.model.dao.BookDao;
import com.dongnebook.book.model.vo.Book;
import com.dongnebook.book.model.vo.BookPageData;


/**
 * @author 김종모
 *
 */
@Service
public class BookService {
	
	@Autowired
	private BookDao dao;
	
	public int insertBook(Book b) {
		return dao.insertBook(b);
	}

	public BookPageData searchBookList(int reqPage) {
		int numPerPage = 10; 		//한페이지 당 게시물 수
		//게시물 10개 가져오기 -> start값, end값 계산
		//reqpage = 1 ->1~10
		//reqpage = 2 ->11~20
		
		int end = reqPage * numPerPage;
		int start= end-numPerPage+1;
		
		ArrayList<Book> list = dao.selectBookList(start,end);
		
		System.out.println(list.get(0).getBookName());
		//pageNavi 제작
		//총 게시물 수
		int totalCount = dao.totalCount();
		
		System.out.println(totalCount);
		
		//총 페이지수
		int totalPage =0;
		if(totalCount%numPerPage==0) {
			totalPage=totalCount/numPerPage;
		}else {
			totalPage=totalCount/numPerPage+1;
		}
		
		//페이지 네비의 길이
		int pageNaviSize=5;
		//페이지 네비 시작번호
		int pageNo=((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		//페이지 네비 작성
		String pageNavi = "";
		//이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<a href='/book/bookList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo!=reqPage) {
				
				pageNavi += "<a href='/book/bookList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}else {
				pageNavi+="<span class='selectedPage'>"+pageNo+"</span>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		//총게시물 전까진  위의 포문 이후엔 페이지 넘버가 각 네비 끝에 와있기에  그것이 총게시물전이라면
		if(pageNo<=totalPage) {
			pageNavi +="<a href='/book/bookList.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		BookPageData npd=new BookPageData(list,pageNavi);
		return npd;
	}

	public int bookDelete(int bookNo) {
		
		return dao.bookDelete(bookNo);
	}
}
