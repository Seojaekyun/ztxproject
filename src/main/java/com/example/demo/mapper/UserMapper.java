package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.UserDto;

@Mapper
public interface UserMapper {
	Integer useridCheck(String userid);
	void userOk(UserDto udto);
	UserDto userView(String userid);
	void updateOk1(UserDto udto);
	void updateOk2(UserDto udto);
	String pwdCheck(String userid);
	int getTotalUserCount();
	List<UserDto> getUserList(int offset, int itemsPerPage);
	void memberUp(UserDto mdto);
	UserDto getUserById(String userId);
	boolean pwdChg(String userid, String newPwd);
	void editEmail(String userid, String email);
	String getPwdByUserid(String userid);
	void editPhone(String userid, String phone);
	boolean idDelete(String userid, String pwd);
	int getCurrentLevel(String userid);
	void updatePreviousLevel(String userid, int currentLevel);
	void updateUserLevel(String userid, int level);
	boolean checkPwd(String userid, String pwd);
	
	
}
