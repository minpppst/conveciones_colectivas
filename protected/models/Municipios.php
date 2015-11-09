<?php

/**
 * This is the model class for table "municipios".
 *
 * The followings are the available columns in table 'municipios':
 * @property integer $id_municipio
 * @property integer $id_estado
 * @property string $municipio
 *
 * The followings are the available model relations:
 * @property Empresa[] $empresas
 * @property Estados $idEstado
 * @property Parroquias[] $parroquiases
 */
class Municipios extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Municipios the static model class
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
		return 'municipios';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_estado, municipio', 'required'),
			array('id_estado', 'numerical', 'integerOnly'=>true),
			array('municipio', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_municipio, id_estado, municipio', 'safe', 'on'=>'search'),
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
			'empresas' => array(self::HAS_MANY, 'Empresa', 'municipio'),
			'idEstado' => array(self::BELONGS_TO, 'Estados', 'id_estado'),
			'parroquiases' => array(self::HAS_MANY, 'Parroquias', 'id_municipio'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_municipio' => 'Id Municipio',
			'id_estado' => 'Id Estado',
			'municipio' => 'Municipio',
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

		$criteria->compare('id_municipio',$this->id_municipio);
		$criteria->compare('id_estado',$this->id_estado);
		$criteria->compare('municipio',$this->municipio,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}