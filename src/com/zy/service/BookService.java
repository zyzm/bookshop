package com.zy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.dao.Impl.BookDaoImpl;
import com.zy.entities.Book;
import com.zy.entities.User;
import com.zy.tools.security.Page;

@Service("bookService")
public class BookService
{
	@Autowired
	private BookDaoImpl bookDao;

	public Page<Book> getCategoryBooks(String cid, Integer pageNumber,
			Integer pageSize)
	{
		// TODO Auto-generated method stub
		List<Book> bookList = bookDao.page("from Book b where b.cid =?",
				pageNumber, pageSize, cid);
		Page<Book> bookPage = new Page<Book>();
		bookPage.setList(bookList);
		bookPage.setPageNo(pageNumber);
		bookPage.setPageSize(pageSize);
		int totalRecords = bookDao.count(
				"select count(*) from Book b where b.cid =?", cid);
		bookPage.setTotalRecords(totalRecords);
		return bookPage;
	}

	public Book findById(String bid)
	{
		// TODO Auto-generated method stub
		Book book = bookDao.get("from Book b where b.bid =?", bid);
		return book;
	}

	public Page<Book> searchBook(String key, int pageNumber, int pageSize)
	{
		// TODO Auto-generated method stub
		List<Book> bookList = bookDao
				.page("from Book b where b.bname like ? or b.author like ? or b.press like ?",
						pageNumber, pageSize, "%" + key + "%", "%" + key + "%",
						"%" + key + "%");
		Page<Book> bookPage = new Page<Book>();
		bookPage.setList(bookList);
		bookPage.setPageNo(pageNumber);
		bookPage.setPageSize(pageSize);
		int totalRecords = bookDao
				.count("select count(*) from Book b where b.bname like ? or b.author like ? or b.press like ?",
						"%" + key + "%", "%" + key + "%", "%" + key + "%");
		bookPage.setTotalRecords(totalRecords);
		return bookPage;
	}

	
}
