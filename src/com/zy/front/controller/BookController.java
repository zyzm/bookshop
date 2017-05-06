package com.zy.front.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zy.entities.Book;
import com.zy.service.BookService;
import com.zy.tools.security.Page;

@Controller
public class BookController
{
	// private static final int DEFAULT_PAGE_NUMBER = 1;
	// private static final int DEFAULT_PAGE_SIZE = 20;

	@Autowired
	private BookService bookService;

	/**
	 * 根据分类ID查询该分类下所有图书
	 */
	@RequestMapping(value = {"/getCategoryBooks"})
	public String getCategoryBooks(HttpServletRequest request,
			@RequestParam(value = "cid") String cid,
			@RequestParam(value = "pageNumber", required = false, defaultValue = "1") int pageNumber,
			@RequestParam(value = "pageSize", required = false, defaultValue = "20") int pageSize)
	{
		Page<Book> bookPage = bookService.getCategoryBooks(cid, pageNumber,
				pageSize);
		request.setAttribute("page", bookPage);
		request.setAttribute("totalPage", bookPage.getTotalPages());
		request.setAttribute("cid", cid);
		return "book/list";
	}
	
	 /*
     * 根据图书ID查询图书详细信息
     */
	@RequestMapping(value = "/findBookById")
    public String findBookById(HttpServletRequest request,@RequestParam(value = "bid") String bid) {
        Book book = bookService.findById(bid);
        request.setAttribute("book", book);
        return "book/desc";
    }

	/**
     * 根据关键字搜索图书
     */
	@RequestMapping(value = "/searchBook")
    public String searchBook(HttpServletRequest request,@RequestParam(value = "key") String key,
			@RequestParam(value = "pageNumber", required = false, defaultValue = "1") int pageNumber,
			@RequestParam(value = "pageSize", required = false, defaultValue = "20")int pageSize){
    	Page<Book> bookPage = bookService.searchBook(key, pageNumber,
				pageSize);
        request.setAttribute("page", bookPage);
        request.setAttribute("totalPage", bookPage.getTotalPages());
        request.setAttribute("key", key);
        return "book/list";
    }
}
