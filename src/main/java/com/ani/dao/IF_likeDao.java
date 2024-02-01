package com.ani.dao;

import java.util.HashMap;
import java.util.List;

import com.ani.vo.LikeVO;

public interface IF_likeDao {
	public void insert(LikeVO lvo);
	public List<LikeVO> selectList(String mid);
	public int selectCont(HashMap<String, String> params);
	public void deleteLike(String likeNo);
}
