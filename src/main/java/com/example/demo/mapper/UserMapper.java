package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.UserDto;

@Mapper
public interface UserMapper {
	public Integer useridCheck(String userid);
	public void userOk(UserDto udto);
	public UserDto userView(String userid);
	public void updateOk1(UserDto udto);
	public void updateOk2(UserDto udto);
	public String pwdCheck(String userid);
	public int getTotalUserCount();
	public List<UserDto> getUserList(int offset, int itemsPerPage);
	public void memberUp(UserDto mdto);
	public UserDto getUserById(String userId);
	public boolean pwdChg(String userid, String newPwd);
	public void editEmail(String userid, String email);
	public String getPwdByUserid(String userid);
	public void editPhone(String userid, String phone);
	public boolean idDelete(String userid, String pwd);
	public int getCurrentLevel(String userid);
	public void updatePreviousLevel(String userid, int currentLevel);
	public void updateUserLevel(String userid, int level);
	public boolean checkPwd(String userid, String pwd);
	
}
