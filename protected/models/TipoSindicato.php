<?php

/**
 * This is the model class for table "tipo_sindicato".
 *
 * The followings are the available columns in table 'tipo_sindicato':
 * @property string $id
 * @property string $nombre_cargo
 *
 * The followings are the available model relations:
 * @property NominaTipoSindicato[] $nominaTipoSindicatos
 */
class TipoSindicato extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return TipoSindicato the static model class
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
		return 'tipo_sindicato';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombre_cargo', 'required'),
			array('nombre_cargo', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombre_cargo', 'safe', 'on'=>'search'),
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
			'nominaTipoSindicatos' => array(self::HAS_MANY, 'NominaTipoSindicato', 'tipo_sindicato'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombre_cargo' => 'Nombre Cargo',
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

		$criteria->compare('id',$this->id,true);
		$criteria->compare('nombre_cargo',$this->nombre_cargo,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}