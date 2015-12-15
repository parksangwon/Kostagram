package com.kostagram.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kostagram.service.beans.ActivityVO;
import com.kostagram.service.beans.ArticleVO;
import com.kostagram.service.beans.ConversationVO;
import com.kostagram.service.beans.HashtagVO;
import com.kostagram.service.beans.PhotoInfoVO;
import com.kostagram.service.beans.ReportVO;
import com.kostagram.service.beans.UserInfoVO;
import com.kostagram.service.dao.ActivityDAO;
import com.kostagram.service.dao.ConversationDAO;
import com.kostagram.service.dao.FollowDAO;
import com.kostagram.service.dao.PhotoInfoDAO;
import com.kostagram.service.dao.ReportDAO;
import com.kostagram.service.dao.UserInfoDAO;
import com.kostagram.service.dao.HashtagDAO;

@Controller
@RequestMapping("/m")
public class MobileController {

	@Autowired
	private UserInfoDAO userInfoDao;

	@Autowired
	private PhotoInfoDAO photoInfoDao;

	@Autowired
	private ActivityDAO activityDao;

	@Autowired
	private ConversationDAO conversationDao;

	@Autowired
	private FollowDAO followDao;
	
	@Autowired
	private ReportDAO reportDao;
	
	@Autowired
	private HashtagDAO hashtagDao;

	// 타임 라인 (메인)
	@RequestMapping("/")
	public String timeLine(HttpSession session, Model model) {

		if (session == null || session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")
				|| session.getAttribute("email") == null) {
			return "mobile/login";
		}
		return "mobile/timeline";
	}

	@RequestMapping("/login")
	public void login(UserInfoVO user, HttpSession session,
			HttpServletResponse res) throws IOException {

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		if (user == null || user.getNickname() == null
				|| user.getPass() == null) {
			out.print("loginFail");
		}

		// userInfoDao로 정보가 있는지 확인
		UserInfoVO findedUser = userInfoDao.findNickname(user);

		if (findedUser != null && findedUser.getPass().equals(user.getPass())) {
			session.setAttribute("loginYn", "Y");
			session.setAttribute("email", findedUser.getEmail());
			session.setAttribute("nickname", findedUser.getNickname());
			out.print("loginSuccess");
		} else {
			out.print("loginFail");
		}
	}

	@RequestMapping("/timeline")
	public void getTimeline(HttpSession session, HttpServletResponse res) throws IOException {
		String email = (String) session.getAttribute("email");

		UserInfoVO user = new UserInfoVO(email);

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		out.print("<div id='photoList'>");
		ArrayList<ArticleVO> timeline = photoInfoDao
				.getTimeline(user);
		if ( timeline.size() != 0 ) {
			for (int i = 0; i < timeline.size(); i++) {
				ArticleVO article = timeline.get(i);
				PhotoInfoVO photo = article.getPhoto();
				String seq_photo = photo.getSeq_photo();
		
				out.print(
						"<div class='article'><div class='photoHeader'><table width='100%'><tr><td width='60'>");
		
				HashMap userInfo = article.getUserInfo();
				String photoNickname = (String) userInfo.get("NICKNAME");
				String profile = (String) userInfo.get("PROFILE_IMG");
				String photoEmail = (String) userInfo.get("EMAIL");
				if (profile == null) {
					out.print(
							"<img src='personalImg/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// 프로필
				} else {
					out.print("<img src='personalImg/" + photoEmail
							+ "/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// 프로필
					// 이미지
				}
				out.print(
						"</td><td align='left'><a href='./m/"+photoNickname+"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
				out.print(photoNickname);// 닉네임
				out.print(
						"</a></td><td align='right' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");

				long uploadTime = System.currentTimeMillis() - photo.getReg_date().getTime();
				if ( uploadTime/(1000*60*60*24*7) != 0 ) {
					out.print( uploadTime/(1000*60*60*24*7) +"주 전" );
				} else if ( uploadTime/(1000*60*60*24) != 0 ) {
					out.print( uploadTime/(1000*60*60*24) + "일 전" );
				} else if ( uploadTime/(1000*60*60) != 0 ) {
					out.print( uploadTime/(1000*60*60) + "분 전" );
				} else if ( uploadTime/(1000*60) != 0 ) {
					out.print( uploadTime/(1000*60) + "초 전");
				} else if ( uploadTime/(1000*30) != 0 ) {
					out.print( "방금" );
				}
				
				out.print(
						"</td></tr></table></div><div class='photoArea'><table width='100%' cellpadding='0' cellspacing='0'><tr><td width='100%' colspan='2'>");
				out.print("<img src='personalImg/" + photoEmail + "/" + seq_photo
						+ ".jpg' width='100%' />");// 올린 사진
				out.print(
						"</td></tr></table></div><div class='CMTnLIK' style='padding: 0px 5px 0px 5px'><table><tr><td align='left'><a href='#'><img src='m/image/icon/heart.png' width='25' />");
				out.print(
						"</a></td><td align='left'><a href='#'><img src='m/image/icon/chat_bubble.png' width='25' /></a></td><td align='right'><a href='./m/report?pid="+seq_photo+"' >");
				out.print(
						"<img src='m/image/icon/warning.png' width='25' /></a></td></tr></table><hr/><table><tr>");
		
				List<HashMap> likeList = article.getLikeList();
				if (likeList.size() < 6) {
					out.print(
							"<td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>♥ ");
					if (likeList.size() == 0) {
						out.print("좋아요");
					}
					for (int j = 0; j < likeList.size(); j++) {
						HashMap like = likeList.get(j);
						String cmtNickname = (String) like.get("NICKNAME");
						out.print(cmtNickname);
					}
					out.print("</a></td>");
				} else {
					out.print(
							"<td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>♥");
					out.print(likeList.size() + "개</a></td></tr>");
				}
				if (photo.getContent() != null) {
					out.print(
							"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
					out.print("닉네임");
					out.print("</a>" + photo.getContent() + "</td></tr>");
				}
		
				List<HashMap> commentList = article.getCommentList();
				if (commentList != null && commentList.size() > 0) {
					if (commentList.size() > 6) {
						out.print(
								"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>댓글 더보기</a></td></tr>");
					}
					for (int j = 0; j < commentList.size(); j++) {
						HashMap comment = commentList.get(j);
						String nickname = (String) comment.get("NICKNAME");
						String content = (String) comment.get("CONTENT");
						out.print(
								"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
						out.print(nickname);
						out.print("</a>" + content + "</td></tr>");
					}
				}
				out.print(
						"</table></div><div class='addCmt' style='padding: 0px 5px 40px 5px'><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>댓글 달기</a></div></div><br/>");
			}
		} else {
			out.print("<br/><span>소중한 순간을 포착하여 공유해보세요</span>");
		}
		out.print("</div>");
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.removeAttribute("email");
		session.removeAttribute("nickname");
		session.setAttribute("loginYn", "N");

		return "mobile/login";
	}

	@RequestMapping("/emailcheck")
	public String emailcheck() {
		return "mobile/emailcheck";
	}

	// 이메일만 보내고 중복을 체크
	@RequestMapping("/validationEmail")
	public void validationEmail(UserInfoVO user, HttpSession session,
			HttpServletResponse res) throws IOException {

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		UserInfoVO findedUser = userInfoDao.findEmail(user);

		if (findedUser != null) {
			// 중복되었음
			out.print("existedEmail");
		} else {
			// 사용가능
			session.setAttribute("email", user.getEmail());
			out.print("availableEmail");
		}
	}

	@RequestMapping("/usercheck")
	public String userCheck() {
		return "mobile/usercheck";
	}

	@RequestMapping("/validationNickname")
	public void validationEmailAndNickname(UserInfoVO user,
			HttpServletResponse res) throws IOException {

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		UserInfoVO findedUserListByEmail = userInfoDao.findEmail(user);
		UserInfoVO findedUSerListByNick = userInfoDao.findNickname(user);
		if (findedUserListByEmail != null) {
			// 중복되었음
			System.out.println("이메일 중복 검사 : 이메일 중복");
			out.print("existedEmail");

		} else if (findedUSerListByNick != null) {

			System.out.println("이메일, 닉네임 중복 검사 : 이메일, 닉네임 중복");
			out.print("existedNickname");

		} else {
			// 사용가능
			System.out.println("이메일, 닉네임 중복 검사 : 이메일, 닉네임 사용 가능");
			boolean result = userInfoDao.insert(user);
			if (result) {
				System.out.println("가입완료");
				out.print("joinSuccess");
			} else {
				System.out.println("DB에러");
				out.print("DBerror");
			}
		}

	}

	@RequestMapping("/round")
	public String round(HttpSession session, ActivityVO activityVO,
			Model model) {
		String email = (String) session.getAttribute("email");

		UserInfoVO user = new UserInfoVO(email);

		// DB에서 정보 가져오기.
		// mynewsList메소드 실행
		List<HashMap> roundList = activityDao.roundList(user);
		List<HashMap> round_profileList = activityDao.round_profileList(user);
		
		// jsp에서 꺼낼수 잇게 보내줌
		model.addAttribute("roundList", roundList);
		model.addAttribute("round_profileList", round_profileList);
		return "mobile/round";
	}

	@RequestMapping("/search_people")
	public String search_people() {
		return "mobile/search_people";
	}
	
	@RequestMapping("/ajaxsearch_people")
	public void ajaxsearchpeople(UserInfoVO userInfoVO, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {
		String nickname = (String)request.getParameter("input_people");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");	

		UserInfoVO findUserVO = new UserInfoVO();
		findUserVO.setNickname(nickname);
		List<UserInfoVO> search_result = userInfoDao.searchNickname(findUserVO);
		if(search_result!=null && search_result.size()>=1) {
			System.out.println(search_result);
			out.print("<table class='search_result'>");
			for (int i = 0; i < search_result.size(); i++) {
				String nick_name = search_result.get(i).getNickname();
				String name = search_result.get(i).getName();
				String profile = search_result.get(i).getProfile_img();
				String email = search_result.get(i).getEmail();
				if(profile!=null && profile=="") {
					out.print("<tr><td align='left' style='padding-left: 15px;'><img src='../personalImg/'" + email + "/" + profile + ".jpg' width='40'"
							+ "style='-webkit-border-radius: 100px; border-radius: 100px;'/></td><td><a href='/Kostagram/m/"+nick_name+"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>"+nick_name+"<br><span style='color:#bdbdbd;'>" + name + "</span></td></tr>");
				} else {
					out.print("<tr><td align='center' style='padding-left: 15px;'><img src='../personalImg/profile.jpg' width='40'"
							+ "style='-webkit-border-radius: 100px; border-radius: 100px;'/></td><td><a href='/Kostagram/m/"+nick_name+"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>"+nick_name+"<br><span style='color:#bdbdbd;'>" + name + "</span></td></tr>");
				}
			}
			out.print("</table>");
		} else {
			out.print("<table class='search_result'>");
			out.print("<tr><td>검색결과가 없습니닭</td></tr>");
			out.print("</table>");
		}
	}

	@RequestMapping("/search_hashtag")
	public String search_hashtag() {
		return "mobile/search_hashtag";
	}
	
	@RequestMapping("/ajaxsearch_hashtag")
	public void ajaxsearchhashtag(UserInfoVO userInfoVO, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException {
		String hashtag = (String)request.getParameter("input_hashtag");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");	
		
		HashtagVO findHashtagVO = new HashtagVO();
		findHashtagVO.setHashtag(hashtag);
		List<HashtagVO> search_result = hashtagDao.searchHashtag(findHashtagVO);
		if(search_result!=null && search_result.size()>=1) {
			System.out.println(search_result);
			out.print("<table class='search_result'>");
			for (int i = 0; i < search_result.size(); i++) {
				String hash_tag = search_result.get(i).getHashtag();
				out.print("<tr><td align='left' style='padding-left: 15px;'><a>#" + hash_tag + "</a></tr>");
			}
			out.print("</table>");
		} else {
			out.print("<table class='search_result'>");
			out.print("<tr><td>검색결과가 없습니닭</td></tr>");
			out.print("</table>");
		}
	}
	
	@RequestMapping("/search_place")
	public String search_place() {
		return "mobile/search_place";
	}

	@RequestMapping("/detail")
	public String detail() {
		return "mobile/detail";
	}

	// 팔로잉 로그 (좋아요 팔로우)
	@RequestMapping("/following")
	public String following(HttpServletRequest request, HttpSession session,Model model) {
		
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		String email = (String) session.getAttribute("email");
		//System.out.println(email);
		List<HashMap> followingList = activityDao.followingList(new UserInfoVO(email));
		//System.out.println(followingList);
		model.addAttribute("followingList", followingList);

		return "mobile/following";

	}

	@RequestMapping("/mynews")
	public String mynews(HttpSession session, ActivityVO activityVO,
			Model model) {

		// DB에서 내(현제 세션에 저장되어있는 email) 게시물에 댓글 또는 좋아요를 한 사람의 닉네임, 사진, find(댓글 or
		// 좋아요)인지 목록을 가져와야한다.
		// session에서 이메일을 받아옴.
		String email = (String) session.getAttribute("email");

		UserInfoVO user = new UserInfoVO(email);

		// DB에서 정보 가져오기.
		// mynewsList메소드 실행
		List<HashMap> mynews = activityDao.mynewsList(user);

		// jsp에서 꺼낼수 잇게 보내줌
		model.addAttribute("mynews", mynews);
		return "mobile/mynews";
	}

	@RequestMapping("/getMyPhotoList")
	public void getMyPhotoList(HttpSession session, HttpServletRequest req,
			HttpServletResponse res) throws IOException {
		String type = (String) req.getParameter("type");
		String email = (String) session.getAttribute("email");

		UserInfoVO user = new UserInfoVO(email);

		PrintWriter out = res.getWriter();

		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");

		out.print("<div id='photoList'>");
		if (type.equals("grid")) {
			List<PhotoInfoVO> myPhotoList = photoInfoDao.getMyPhotoList(user);
			if (myPhotoList != null && myPhotoList.size() > 0) {
				out.print("<ul class='myPhotoListByGrid'>");
				for (int i = 0; i < myPhotoList.size(); i++) {
					PhotoInfoVO photo = myPhotoList.get(i);
					String seq_photo = photo.getSeq_photo();
					out.print("<li><a href='./detail?pid=" + seq_photo
							+ "'><img src='../personalImg/" + email + "/"
							+ seq_photo + ".jpg' alt='" + seq_photo
							+ "' /></a></li>");
				}
				out.print("</ul>");
			} else {
				out.print("<span>소중한 순간을 포착하여 공유해보세요</span>");
			}
		} else if (type.equals("list")) {
			ArrayList<ArticleVO> myPhotoList = photoInfoDao
					.getMyPhotoListForArticle(user);
			if (myPhotoList.size() != 0) {
				for (int i = 0; i < myPhotoList.size(); i++) {
					ArticleVO article = myPhotoList.get(i);
					PhotoInfoVO photo = article.getPhoto();
					String seq_photo = photo.getSeq_photo();

					out.print(
							"<div class='article'><div class='photoHeader'><table width='100%'><tr><td width='60'>");

					HashMap userInfo = article.getUserInfo();
					String photoNickname = (String) userInfo.get("NICKNAME");
					String profile = (String) userInfo.get("PROFILE");
					if (profile == null) {
						out.print(
								"<img src='../personalImg/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// 프로필
					} else {
						out.print("<img src='../personalImg/" + email
								+ "/profile.jpg' width='60' id='profileImg' style='-webkit-border-radius: 100px; border-radius: 100px;' />");// 프로필
						// 이미지
					}
					out.print(
							"</td><td align='left'><a href='./m/"+photoNickname+"' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
					out.print(photoNickname);// 닉네임
					out.print(
							"</a></td><td align='right' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
					
					long uploadTime = System.currentTimeMillis() - photo.getReg_date().getTime();
					if ( uploadTime/(1000*60*60*24*7) != 0 ) {
						out.print( uploadTime/(1000*60*60*24*7) +"주 전" );
					} else if ( uploadTime/(1000*60*60*24) != 0 ) {
						out.print( uploadTime/(1000*60*60*24) + "일 전" );
					} else if ( uploadTime/(1000*60*60) != 0 ) {
						out.print( uploadTime/(1000*60*60) + "분 전" );
					} else if ( uploadTime/(1000*60) != 0 ) {
						out.print( uploadTime/(1000*60) + "초 전");
					} else if ( uploadTime/(1000*30) != 0 ) {
						out.print( "방금" );
					}
					
					out.print(
							"</td></tr></table></div><div class='photoArea'><table width='100%' cellpadding='0' cellspacing='0'><tr><td width='100%' colspan='2'>");
					out.print("<img src='../personalImg/" + email + "/"
							+ seq_photo + ".jpg' width='100%' />");// 올린 사진
					out.print(
							"</td></tr></table></div><div class='CMTnLIK' style='padding: 0px 5px 0px 5px'><table><tr><td align='left'><a href='#'><img src='./image/icon/heart.png' width='25' />");
					out.print(
							"</a></td><td align='left'><a href='#'><img src='./image/icon/chat_bubble.png' width='25' /></a></td><td align='right'><a href='./report?pid="+seq_photo+"'>");
					out.print(
							"<img src='./image/icon/warning.png' width='25' /></a></td></tr></table><hr/><table><tr>");

					List<HashMap> likeList = article.getLikeList();
					if (likeList.size() < 6) {
						out.print(
								"<td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>♥ ");
						if (likeList.size() == 0) {
							out.print("좋아요");
						}
						for (int j = 0; j < likeList.size(); j++) {
							HashMap like = likeList.get(j);
							String cmtNickname = (String) like.get("NICKNAME");
							out.print(cmtNickname);
						}
						out.print("</a></td>");
					} else {
						out.print(
								"<td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>♥");
						out.print(likeList.size() + "개</a></td></tr>");
					}
					if (photo.getContent() != null) {
						out.print(
								"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
						out.print("닉네임");
						out.print("</a>" + photo.getContent() + "</td></tr>");
					}

					List<HashMap> commentList = article.getCommentList();
					if (commentList != null && commentList.size() > 0) {
						if (commentList.size() > 6) {
							out.print(
									"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>댓글 더보기</a></td></tr>");
						}
						for (int j = 0; j < commentList.size(); j++) {
							HashMap comment = commentList.get(j);
							String nickname = (String) comment.get("NICKNAME");
							String content = (String) comment.get("CONTENT");
							out.print(
									"<tr><td><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #004879; font-weight: normal;'>");
							out.print(nickname);
							out.print("</a> " + content + "</td></tr>");
						}
					}
					out.print(
							"</table></div><div class='addCmt' style='padding: 0px 5px 40px 5px'><a href='#' style='text-decoration: none; text-shadow: 0px 0px 0px; color: #353535; font-weight: normal;'>댓글 달기</a></div></div>");
				}
			}  else {
				out.print("<span>소중한 순간을 포착하여 공유해보세요</span>");
			}
		} else {
			out.print("잘못된 요청입니다. 다시 시도해 주세요.");
		}
		out.print("</div>");

	}

	@RequestMapping("/profileupdate")
	public String profileupdate(UserInfoVO userInfoVO, HttpSession session,
			HttpServletRequest request, HttpServletResponse response,
			Model model) throws IOException {
		// session에서 nickname을 받아 DB 갔다옴
		String nickname = (String) session.getAttribute("nickname");
		userInfoVO.setNickname(nickname);
		// findNickname 메소드 실행
		UserInfoVO userinfo = userInfoDao.findNickname(userInfoVO);

		model.addAttribute("userinfo", userinfo);
		return "mobile/profileupdate";
	}

	@RequestMapping("/ajaxprofileupdate")
	public void profileupdate(UserInfoVO userInfoVO, HttpSession session,
			HttpServletResponse response, Model model) throws IOException {
		String nickname = (String) session.getAttribute("nickname");

		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setHeader("Cache-Control", "no-cache");

		UserInfoVO findUserVO = new UserInfoVO();
		findUserVO.setNickname(userInfoVO.getNickname());

		findUserVO = userInfoDao.findNickname(findUserVO);

		System.out.println("select :" + userInfoVO);
		if (userInfoVO.getNickname() == null
				|| findUserVO.getNickname().equals(nickname)) {
			userInfoVO.setUpdatenickname(nickname);
			boolean result = userInfoDao.update(userInfoVO);
			if (result) {
				out.print("updateSuccess");

				session.removeAttribute("nickname");
				session.setAttribute("nickname", userInfoVO.getNickname());

			} else

			{
				out.print("updateFail");
			}
		} else {
			out.print("nicknameduplication");
		}

		// session에서 nickname을 받아 DB 갔다옴

	}

	@RequestMapping("/option")
	public String option() {
		return "mobile/option";
	}

	@RequestMapping("/findphonenumber")
	public String findphonenumber(UserInfoVO userInfoVO, Model model) {
		
		UserInfoVO findUserVO = new UserInfoVO();
		List<UserInfoVO> userinfo = userInfoDao.findFriend(findUserVO);
		
		model.addAttribute("userinfo", userinfo);
		System.out.println(userinfo);
		return "mobile/findphonenumber";
	}

	// 비밀번호 변경 페이지 가기
	@RequestMapping("/pwupdate")
	public String pwupdate(HttpServletRequest request, HttpSession session,
			Model model) {

		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		String email = (String) session.getAttribute("email");
		return "mobile/pwupdate";

	}

	// 비밀번호 변경하기
	@RequestMapping("/pwupdate/update")
	public String pwupdateUpdate(HttpServletRequest request,
			HttpSession session, Model model) {
		// 로그인을 안한 상태면 로그인 페이지로 강제이동
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// 입력한 원래 비밀번호와 변경할 비밀번호를 가져온다
		String email = (String) session.getAttribute("email");
		String pw = request.getParameter("oldPass");
		String newPw = request.getParameter("newPass");
		// 원래 비밀번호가 일치할 경우 변경할 비밀번호를 DAO로 보낸다. 성공했을시 userpage로 이동
		boolean pwCheck = userInfoDao.pwCheck(new UserInfoVO(email, pw));
		if (pwCheck == true) {
			boolean pwUpdate = userInfoDao
					.pwUpdate(new UserInfoVO(email, newPw));
			return "mobile/userpage";
		}
		// 원래 비밀번호가 틀린 경우 다시 비밀번호 변경 페이지로
		else if (pwCheck == false) {
			return "mobile/pwupdate";
		}
		return "mobile/login";
	}

	// 좋아한 게시물 보여주기
	@RequestMapping("/likenotice")
	public String likenotice(HttpSession session, ActivityVO activityVO,
			Model model) {

		// 로그인을 안한 상태면 로그인 페이지로 강제이동
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// 로그인을 한 상태면 자신의 아이디를 가져와서 DAO로 보낸 다음 자신의 아이디에 맞는 likeNoticeList를 가져온다.
		String email = (String) session.getAttribute("email");
		UserInfoVO user = new UserInfoVO(email);
		
		List<HashMap> mylikeList = activityDao.mylikeList(user);

		// 가져온 likeNoticeList 를 뷰와 공유
		
		model.addAttribute("mylikeList", mylikeList);

		return "mobile/likenotice";
	}
	
	@RequestMapping("/report")
	public String goToReportPage(@RequestParam String pid, Model model) {
		model.addAttribute("pid", pid);
		return "mobile/report";
	}
	
	@RequestMapping("/reportphoto")
	public void reportPhoto(@RequestParam String pid, @RequestParam String rid, HttpSession session, HttpServletResponse res) throws IOException {
		PrintWriter out = res.getWriter();
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html");
		res.setHeader("Cache-Control", "no-cache");
		
		ReportVO report = new ReportVO();
		report.setSeq_photo(pid);
		report.setEmail((String)session.getAttribute("email"));
		report.setContent_id(rid);
		
		if ( reportDao.insert(report) ) {
			out.print("reportSuccess");
		} else {
			out.print("reportFailed");
		}
	}
	
	// 채팅 리스트
	@RequestMapping("/chatting")
	public String chatting(HttpServletRequest request, HttpSession session,
			Model model) {

		// 로그인을 안한 상태면 로그인 페이지로 강제이동
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// 로그인을 한 상태면 자신의 아이디를 가져와서 ConversationDAO로 보낸 다음 자신의 아이디에 맞는
		// chattinglist를 가져온다.
		String email = (String) session.getAttribute("email");
		List<ConversationVO> chattinglist = conversationDao
				.selectList(new UserInfoVO(email));
		// 가져온 chattinglist 를 뷰와 공유

		return "mobile/chattinglist";

	}

	// 채팅 리스트 (대화상대 추가)
	@RequestMapping("/chattinginsert")
	public String chattinginsert(HttpServletRequest request,
			HttpSession session, Model model) {

		// 로그인을 안한 상태면 로그인 페이지로 강제이동
		if (session == null || session.getAttribute("email") == null
				|| session.getAttribute("loginYn") == null
				|| session.getAttribute("loginYn").equals("N")) {
			return "mobile/login";
		}

		// 상대 아이디를 받아온 다음 ConversationDao 를 통해 대화 상대를 추가 한뒤
		// 다시 chattinglist 페이지로 이동
		String someoneEmail = request.getParameter("someoneEmail");
		boolean result = conversationDao.insert(new UserInfoVO(someoneEmail));

		return "mobile/chattinglist";

	}
	
	@RequestMapping("/{nickname}")
	public String userpage(@PathVariable String nickname, Model model) {

		UserInfoVO user = new UserInfoVO();
		user.setNickname(nickname);

		user = userInfoDao.findNickname(user);
		
		if (user != null) {
			model.addAttribute("email", user.getEmail());
			model.addAttribute("nickname", user.getNickname());
			model.addAttribute("profile", user.getProfile_img());
			model.addAttribute("message", user.getMessage());
			model.addAttribute("photoCnt", photoInfoDao.countMyPhoto(user));
			model.addAttribute("followerCnt", followDao.getMyFollower(user));
			model.addAttribute("followingCnt", followDao.getMyFollowing(user));
	
			return "mobile/userpage";
		} else {
			model.addAttribute("nickname", nickname);
			return "mobile/usernotfound";
		}
	}
	
	@RequestMapping("/comment")
	public String comment() {
		return "mobile/comment";
	}
}
