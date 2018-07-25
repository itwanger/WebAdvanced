package com.cmower.database.enumtype;

public enum YesOrNoType {
	YES(1), // 删除
	NO(0);// 未删除
	private int value;

	private YesOrNoType(int value) {
		this.value = value;
	}

	/**
	 * 检查是否枚举值
	 * 
	 * @param value
	 * @return
	 */
	public static boolean checkValue(int value) {
		for (YesOrNoType e : YesOrNoType.values()) {
			if (e.value == value) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 判断值是否相等
	 * 
	 * @param value
	 * @return
	 */
	public boolean equals(Integer type) {
        return this.value == type.intValue();
    }

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}
}
