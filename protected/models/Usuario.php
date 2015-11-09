<?php

/**
 * This is the model class for table "usuario".
 *
 * The followings are the available columns in table 'usuario':
 * @property string $id
 * @property string $nombres
 * @property integer $cedula
 * @property string $correo
 * @property integer $nivel
 * @property integer $estatus
 * @property string $telefono
 * @property string $login
 * @property string $clave
 */
class Usuario extends CActiveRecord
{

    
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Usuario the static model class
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
		return 'usuario';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('nombres, cedula, correo, nivel, estatus, telefono, login, clave', 'required'),
			array('cedula, nivel, estatus', 'numerical', 'integerOnly'=>true),
			array('nombres, correo, login, clave', 'length', 'max'=>255),
			array('telefono', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, nombres, cedula, correo, nivel, estatus, telefono, login, clave', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'nombres' => 'Nombres',
			'cedula' => 'Cedula',
			'correo' => 'Correo',
			'nivel' => 'Nivel',
			'estatus' => 'Estatus',
			'telefono' => 'Telefono',
			'login' => 'Login',
			'clave' => 'Clave',
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
		$criteria->compare('nombres',$this->nombres,true);
		$criteria->compare('cedula',$this->cedula);
		$criteria->compare('correo',$this->correo,true);
		$criteria->compare('nivel',$this->nivel);
		$criteria->compare('estatus',$this->estatus);
		$criteria->compare('telefono',$this->telefono,true);
		$criteria->compare('login',$this->login,true);
		$criteria->compare('clave',$this->clave,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        
}