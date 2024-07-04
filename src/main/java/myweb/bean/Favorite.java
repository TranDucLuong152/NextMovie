package myweb.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*; 


/**
 * The persistent class for the Favorite database table.
 *
 */
@Entity
@NamedQuery(name="Favorite.findAll", query="SELECT f FROM Favorite f")
public class Favorite implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="tenTaiKhoan")
	private User user;

	//bi-directional many-to-one association to Video
	@ManyToOne
	@JoinColumn(name="videoID")
	private Video video;

	private Date dateLike;

	public Favorite( User user, Video video, Date dateLike) {
		super();

		this.user = user;
		this.video = video;
		this.dateLike = dateLike;
	}

	public Date getDateLike() {
		return dateLike;
	}

	public void setDateLike(Date dateLike) {
		this.dateLike = dateLike;
	}

	public Favorite() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return this.video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

}