package com.coder.model;
// Generated May 28, 2020 10:14:49 PM by Hibernate Tools 5.0.6.Final

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * BookShellId generated by hbm2java
 */
@Embeddable
public class BookShellId implements java.io.Serializable {

	private int bookId;
	private int shellId;

	public BookShellId() {
	}

	public BookShellId(int bookId, int shellId) {
		this.bookId = bookId;
		this.shellId = shellId;
	}

	@Column(name = "book_id", nullable = false)
	public int getBookId() {
		return this.bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	@Column(name = "shell_id", nullable = false)
	public int getShellId() {
		return this.shellId;
	}

	public void setShellId(int shellId) {
		this.shellId = shellId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof BookShellId))
			return false;
		BookShellId castOther = (BookShellId) other;

		return (this.getBookId() == castOther.getBookId()) && (this.getShellId() == castOther.getShellId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + this.getBookId();
		result = 37 * result + this.getShellId();
		return result;
	}

}