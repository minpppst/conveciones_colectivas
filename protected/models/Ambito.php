<?php

/**
 * This is the model class for table "ambito".
 *
 * The followings are the available columns in table 'ambito':
 * @property integer $id
 * @property string $nombre_ambito
 *
 * The followings are the available model relations:
 * @property Convencion[] $convencions
 */
class Ambito extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Ambito the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'ambito';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, nombre_ambito', 'required'),
			array('id', 'numerical', 'integerOnly'=>true),
			array('nombre_ambito', 'length', 'max'=>25),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre_ambito', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'convencions' => array(self::HAS_MANY, 'Convencion', 'ambito'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre_ambito' => 'Nombre Ambito',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('nombre_ambito',$this->nombre_ambito,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}