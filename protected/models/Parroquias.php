<?php

/**
 * This is the model class for table "parroquias".
 *
 * The followings are the available columns in table 'parroquias':
 * @property integer $id_parroquia
 * @property integer $id_municipio
 * @property string $parroquia
 *
 * The followings are the available model relations:
 * @property Empresa[] $empresas
 * @property Municipios $idMunicipio
 */
class Parroquias extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Parroquias the static model class
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
		return 'parroquias';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_municipio, parroquia', 'required'),
			array('id_municipio', 'numerical', 'integerOnly'=>true),
			array('parroquia', 'length', 'max'=>250),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_parroquia, id_municipio, parroquia', 'safe', 'on'=>'search'),
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
			'empresas' => array(self::HAS_MANY, 'Empresa', 'parroquia'),
			'idMunicipio' => array(self::BELONGS_TO, 'Municipios', 'id_municipio'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_parroquia' => 'Id Parroquia',
			'id_municipio' => 'Id Municipio',
			'parroquia' => 'Parroquia',
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

		$criteria->compare('id_parroquia',$this->id_parroquia);
		$criteria->compare('id_municipio',$this->id_municipio);
		$criteria->compare('parroquia',$this->parroquia,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}